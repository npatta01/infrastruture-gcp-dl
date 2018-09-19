variable region {
  default = "us-east1"
}

variable zone {
  default = "us-east1-c"
}


variable machine_type {
  default = "n1-standard-4"
}

variable "gpu_type" {
  default = "nvidia-tesla-k80"
}

variable "gpu_count" {
  default = "1"
}


variable project {
  description = "Google Cloud project id"
  default = "np-training"
}


variable dl_image {
  description = "Image used by dl vm"
  default = "deeplearning-platform-release/common-cu90"
}

variable gce_ssh_user {
  description = "Google Cloud ssh user"
  default = "ubuntu"
}

variable gce_ssh_pub_key_file {
  description = "Google Cloud ssh public key"
  default = "~/.ssh/id_rsa.pub"
}

variable private_key_path {
  description = "Google Cloud ssh private key"
  default = "~/.ssh/id_rsa"
}

provider google {
  region  = "${var.region}"
  zone    = "${var.zone}"
  project = "${var.project}"
}
