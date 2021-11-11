provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id = var.subnet
  ami= var.ami
  instance_type = var.instance
  vpc_security_group_ids = [var.securityGroup]
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "ec2-mariana-tf-variaveis"
  }
}

/* 
  subnet_id = "subnet-0c400441905918ceb"
  ami= "ami-035bebdd93770d11c"
  instance_type = "t2.micro" 
  vpc_security_group_ids = [sg-0bff3eec927fca337] 
*/
