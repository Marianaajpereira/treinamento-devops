provider "aws" {
  region = "sa-east-1"
}
resource "aws_instance" "web" {
  subnet_id = var.subnet
  ami= var.ami
  instance_type = var.instance
  key_name = "kp-treinamento-itau-turma2-mariana"
  vpc_security_group_ids = [var.securityGroup]
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "ec2-mariana-java"
  }
}

output "instance_public_dns" {
  value = [
    aws_instance.web.public_dns
  ]
  description = "Mostra o DNS e os IPs publicos e privados da maquina criada."
}

/* 
  subnet_id = "subnet-0c400441905918ceb"
  ami= "ami-035bebdd93770d11c"
  instance_type = "t2.micro" 
  vpc_security_group_ids = [sg-0bff3eec927fca337] 
*/
