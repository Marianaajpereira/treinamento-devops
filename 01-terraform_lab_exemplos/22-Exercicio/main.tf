provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web1" {
  subnet_id = aws_subnet.subnet-1a-mariana.id
  ami= "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mariana-tf-1"
  }
}

resource "aws_instance" "web2" {
  subnet_id = aws_subnet.subnet-1b-mariana.id
  ami= "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mariana-tf-2"
  }
}

resource "aws_instance" "web3" {
  subnet_id = aws_subnet.subnet-1c-mariana.id
  ami= "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mariana-tf-3"
  }
}

resource "aws_instance" "web4" {
  subnet_id = aws_subnet.subnet-1d-mariana.id
  ami= "ami-083654bd07b5da81d"
  instance_type = "t2.micro"
  associate_public_ip_address = false
  vpc_security_group_ids  = [
    "${aws_security_group.allow_ssh_terraform.id}",
  ]
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-mariana-tf-4"
  }
}

