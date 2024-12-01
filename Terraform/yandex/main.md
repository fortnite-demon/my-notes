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

resource "yandex_vpc_network" "network" {
  name = "app-net"
}
resource "yandex_vpc_subnet" "subnet" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  name           = "app-net-subnet-a"
  v4_cidr_blocks = ["10.1.0.0/24"]
}

resource "yandex_lb_network_load_balancer" "load_balance" {
  name = "load_balance"
  listener {
    name        = "http"
    port        = 80
    target_port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.target_group.id
    healthcheck {
      name                = "healthcheck"
      interval            = 10
      timeout             = 5
      unhealthy_threshold = 2
      healthy_threshold   = 2
    }
  }
}

resource "yandex_lb_target_group" "target_group" {
  name = "web-app"
  target {
    address   = "yandex_compute_instance.instance[*].network_interface.0.ip_address"
    subnet_id = yandex_vpc_subnet.subnet.id
  }
}

resource "yandex_compute_instance" "instance" {
  count    = 2
  name     = "terraform-instance-${count.index}"
  hostname = "ubuntu-2404-${count.index}"
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      type     = "network-hdd"
      size     = 10
      image_id = "fd80293ig2816a78q276"
    }

  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }
}

```
