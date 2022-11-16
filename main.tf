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

  # point to the key-pair's id
  key_name = aws_key_pair.server.id
  #   link the security group to this resource for accessibility
  vpc_sec_grp_ids = [aws_security_group.ssh-access.id]
}

# point to the key-pair's path with this resource
resource "aws_key_pair" "server" {
  public_key = file("root/.ssh/vm-key.pem")
}

# to allow access to this resource (nginx), you configure a security group
resource "aws_security_group" "ssh-access" {
  name        = "ssh-access"
  description = "allows ssh access from the internet"
  #   how it can be accessed
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}