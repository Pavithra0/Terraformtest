#Provider

provider "google" {
  credentials = file("${var.credentials}")
  project = "${var.project}"
  region = "${var.region}"
  zone = "${var.zone}"
}

#VPC

resource "google_compute_network" "vpc" {
  name = "${var.name}-vpc"
  auto_create_subnetworks = "false"
}

#Subnet

resource "google_compute_subnetwork" "subnet" {
  name = "${var.name}-subnet"
  ip_cidr_range = "${var.subnet_cidr}"
  network = "${var.name}-vpc"
  depends_on = ["google_compute_network.vpc"]
  region = "${var.region}"
}

#Firewall configuration

resource "google_compute_firewall" "firewall" {
  name = "${var.name}-firewall"
  network = "${google_compute_network.vpc.name}"
  
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp" 
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

#Instance

resource "google_compute_instance" "linuxserver" {
   name = "${var.name}"
   machine_type = "${var.machine_type}"
   
   boot_disk {
      initialize_params {
      image = "centos-cloud/centos-6"
   }
 }
network_interface {
   network = "default"
   #network = "${google_compute_network.vpc.name}"
   access_config {}
}
}