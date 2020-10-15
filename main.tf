provider "aws" {
  region = var.aws_region
}
resource "aws_key_pair" "key" {
  key_name   = "ssh-key"
  public_key = file(var.public_key_path)
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "my_vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "my_subnet"
  }
}

resource "aws_network_interface" "network_interface" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

resource "aws_instance" "ec2" {
  count         = var.node_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.key.key_name

  network_interface {
    network_interface_id = aws_network_interface.network_interface.id
    device_index         = 0
  }
}
