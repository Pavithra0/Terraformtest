variable "credentials" {
  default = "terraform-gcp-288808-ea57bd67d8d1.json"
  description = "credentials"
}


variable "project" {
  default = "terraform-gcp-288808"
  description = "project"
}

variable "region" {
  default = "us-central1"
  description = "region"
}

variable "zone" {
  default = "us-central1-a"
  description = "zone"
}

variable "machine_type" {
  default = "f1-micro"
  description = "machine type"
}


variable "name" {
  default = "linuxterraform"
  description = "name"
}

variable "subnet_cidr" {
  default = "10.128.0.0/20"
  description = "subnet_cidr"
}

variable "image" {
  default = "centos-cloud/centos-6"
  description = "image"
}