```tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">= 0.100"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.44"
    }
  }
}
provider "aws" {
  region                      = "eu-west-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key                  = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  endpoints {
    dynamodb = yandex_ydb_database_serverless.database.document_api_endpoint
  }
}

variable "name" {
  description = "Unique Name of the Bucket"
  type        = string
}

data "yandex_client_config" "client" {}

# Создание сервисного аккаунта
resource "yandex_iam_service_account" "sa" {
  name        = "${var.name}-sa"
  description = "Service account for Terraform state"
}

# Назначение роли сервисному аккаунту — storage
resource "yandex_resourcemanager_folder_iam_member" "sa-admin-s3" {
  folder_id = data.yandex_client_config.client.folder_id
  role      = "storage.admin"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Назначение роли сервисному аккаунту — kms
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-kms" {
  folder_id = data.yandex_client_config.client.folder_id
  role      = "kms.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Назначение роли сервисному аккаунту — ydb
resource "yandex_resourcemanager_folder_iam_member" "sa-editor-ydb" {
  folder_id = data.yandex_client_config.client.folder_id
  role      = "ydb.editor"
  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
}

# Создание статического ключа доступа
resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
  service_account_id = yandex_iam_service_account.sa.id
  description        = "Static access key for bucket ${var.name} and YDB"
}

# Создание симметричного ключа шифрования
resource "yandex_kms_symmetric_key" "key" {
  name            = "${var.name}-kms"
  description     = "Key for bucket ${var.name}"
  rotation_period = "8760h" # 1год
}

# Создание бакета
resource "yandex_storage_bucket" "state" {
  bucket     = var.name #${random_string.unique_id.result}
  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = true
  }
  lifecycle_rule {
    enabled = true
    noncurrent_version_expiration {
      days = 30
    }
  }
}

# Создание YDB-базы для блокировки state-файла
resource "yandex_ydb_database_serverless" "database" {
  name = "${var.name}-ydb"
}

# Ожидание после создание YDB
resource "time_sleep" "wait_for_database" {
  create_duration = "60s"
  depends_on      = [yandex_ydb_database_serverless.database]
}

# Создание таблицы в YDB для блокировки state-файла
resource "aws_dynamodb_table" "lock_table" {
  name         = "state-lock-table"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
  depends_on   = [time_sleep.wait_for_database, yandex_resourcemanager_folder_iam_member.sa-editor-ydb, yandex_iam_service_account_static_access_key.sa-static-key]
}

# Создание файла .env с ключами доступа
resource "local_file" "env" {
  content = <<EOH
    export AWS_ACCESS_KEY_ID="${yandex_iam_service_account_static_access_key.sa-static-key.access_key}"
    export AWS_SECRET_ACCESS_KEY="${yandex_iam_service_account_static_access_key.sa-static-key.secret_key}"
  EOH
  filename = ".env"
}

output "backend_tf" {
  value = <<EOH

terraform {
  backend "s3" {
    region         = "ru-central1"
    bucket         = "${yandex_storage_bucket.state.id}"
    key            = "terraform.tfstate"

    dynamodb_table = "${aws_dynamodb_table.lock_table.id}"

    endpoints = {
      s3       = "https://storage.yandexcloud.net",
      dynamodb = "${yandex_ydb_database_serverless.database.document_api_endpoint}"
    }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
EOH
}
```
