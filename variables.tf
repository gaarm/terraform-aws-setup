# aws region
variable "aws_region" {
  default = "eu-central-1"
}

# instance type
variable "instance_type" {
  default = "t2.micro"
}

# ami - public image ubuntu 18.04
variable "ami" {
  default = "ami-04932daa2567651e7"
}

# node count
variable "node_count" {
  default = "1"
}

# default linux user
variable "user" {
  default = "ubuntu"
}

# location to public key
variable "public_key_path" {
  default = "~/.ssh/amazon.pub"
}

# location to private key
variable "priv_key_path" {
  default = "~/.ssh/amazon"
}
