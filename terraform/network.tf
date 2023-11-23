resource "yandex_vpc_network" "vpc_nt" {
  name = "network"
}

resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = "subnet"
  network_id     = yandex_vpc_network.vpc_nt.id
  v4_cidr_blocks = ["10.0.0.0/16"]
  zone           = "ru-central1-a"
}

resource "yandex_vpc_gateway" "vpc_gateway" {
  name = "gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "vpc_route" {
  network_id = yandex_vpc_network.vpc_nt.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.vpc_gateway.id
  }
}

resource "yandex_vpc_security_group" "vpc_sg" {
  name       = "sec_group"
  network_id = yandex_vpc_network.vpc_nt.id

  ingress {
    port           = -1
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    port           = -1
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
