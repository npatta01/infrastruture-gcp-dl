resource "google_compute_instance" "dl" {
  name         = "dl"
  machine_type = "${var.machine_type}"

  tags = ["dl"]

  boot_disk {
    initialize_params {
      image = "${var.dl_image}"
      size  = 30
    }
  }

  scheduling {
    preemptible         =   true
    automatic_restart   =   false   
  }

  guest_accelerator {
    type    =   "${var.gpu_type}"
    count   =   "${var.gpu_count}"

  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}",
    jupyter-user = "${var.gce_ssh_user}",
    install-nvidia-driver = "True"
  }

}

resource "null_resource" "setup_dl" {
  triggers {
    instance_id = "${google_compute_instance.dl.id}"
  }

  connection {
    type = "ssh"
    user = "${var.gce_ssh_user}"
    private_key = "${file("${var.private_key_path}")}"
    host = "${google_compute_instance.dl.network_interface.0.access_config.0.assigned_nat_ip }"
    timeout = "40m"
  }

  provisioner "file" {
    source      = "scripts/dl.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "set -x",
      "chmod +x /tmp/script.sh",
      "bash -x /tmp/script.sh"
    ]
  }
}

