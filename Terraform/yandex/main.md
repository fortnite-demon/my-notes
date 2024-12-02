[Справочник ресурсов](https://terraform-provider.yandexcloud.net/)

```tf
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}
provider "yandex" {
  token     = var.token
  cloud_id  = var.cloudid
  folder_id = var.folderid
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "instance" {
  for_each    = toset(["0", "1"])
  platform_id = "standard-v1"
  name        = "dev-instance-${each.key}"
  hostname    = "dev-ubuntu-2004-lts-oslogin-${each.key}"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd80c3igl4ivrjvjfljm"
      size     = 10
      type     = "network-hdd"
    }
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
}
resource "yandex_vpc_network" "network" {
  name = "network-dev"
}
resource "yandex_vpc_subnet" "subnet" {
  v4_cidr_blocks = ["10.10.0.0/24", "10.11.0.0/24"]
  network_id     = yandex_vpc_network.network.id
  name           = "network-dev-subnet-a-1"
}
resource "yandex_lb_target_group" "target_group" {
  name = "terraform-group"
  dynamic "target" {
    for_each = tomap(yandex_compute_instance.instance)
    content {
      subnet_id = target.value.network_interface.0.subnet_id
      address   = target.value.network_interface.0.ip_address
    }
  }
}
resource "yandex_lb_network_load_balancer" "load_balancer" {
  name = "loadbalancer"
  listener {
    name        = "http"
    port        = 80
    target_port = 80
    protocol    = "tcp"
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id
    healthcheck {
      name                = "http"
      interval            = 10
      timeout             = 5
      healthy_threshold   = 2
      unhealthy_threshold = 2
      tcp_options {
        port = 80
      }
    }
  }
}

```
