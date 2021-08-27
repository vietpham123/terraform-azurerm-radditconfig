resource "null_resource" "raddit" {
  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/Artemmkin/raddit.git",
      "cd ./raddit",
      "sudo bundle install",
      "sudo systemctl start raddit",
      "sudo systemctl enable raddit"
    ]

    connection {
      type        = "ssh"
      host        = var.vpc_hostname
      user        = var.user_name
      password    = var.user_password
      timeout     = "1m"
    }
  }
}
