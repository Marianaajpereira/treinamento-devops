provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  subnet_id = "subnet-0c400441905918ceb"
  ami= "ami-035bebdd93770d11c"
  instance_type = "t2.micro" 
  key_name = "kp-treinamento-itau-turma2-mariana" # Nome da Key gerada pelo ssk-keygem e upada na AWS
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = "ec2-mariana-tr-sg"
  }
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
}