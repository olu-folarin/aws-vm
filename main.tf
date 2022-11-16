resource "aws_instance" "webserver" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name        = "webserver"
    Description = "a web server created with a virtual machine"
  }

  #   pass in a bash scriptto be run by this config to install nginx
  user_data = <<-EOF
            #!/bin/bash
            sudo apt update
            sudo apt install nginx -y
            systemctl enable nginx
            systemctl start nginx
            EOF
}