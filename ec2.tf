# Define webserver inside the public subnet

resource "aws_instance" "web-server1" {
  ami                         = var.ami
  instance_type               = "m5.large"
  subnet_id                   = aws_subnet.public-subnet1.id
  vpc_security_group_ids      = ["${aws_security_group.sgweb.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "Class-Demo-KP"
  user_data                   = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd.x86_64
              systemctl start httpd.service
              systemctl enable httpd.service
              echo "AWS Solutions Architect RULES**** Test my Terraform Server User-data. $(hostname -f)" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "Terraform-Webserver"
    Builder     = "Dennis O"
    Application = "Apache-Server-Test"
    Date        = "7-6"
  }
}

resource "aws_instance" "web-server2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public-subnet2.id
  vpc_security_group_ids      = ["${aws_security_group.sgweb.id}"]
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = "Class-Demo-KP"
  user_data                   = file("apache_install.sh")

  tags = {
    Name        = "Terraform-Webserver"
    Builder     = "Dennis O"
    Application = "Apache"
    Date        = "7-6"
  }
}
# Define database inside the private subnet
resource "aws_instance" "database-server1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private-subnet3.id
  vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
  source_dest_check      = false
  key_name               = "Class-Demo-KP"

  tags = {
    Name        = "Terraform-Database"
    Builder     = "Dennis O"
    Application = "MYSQL"
    Date        = "7-6"
  }
}

# Define database inside the private subnet
resource "aws_instance" "database-server2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private-subnet4.id
  vpc_security_group_ids = ["${aws_security_group.sgdb.id}"]
  source_dest_check      = false
  key_name               = "Class-Demo-KP"

  tags = {
    Name        = "Terraform-Database"
    Builder     = "Dennis O"
    Application = "MYSQL"
    Date        = "7-6"
  }
}