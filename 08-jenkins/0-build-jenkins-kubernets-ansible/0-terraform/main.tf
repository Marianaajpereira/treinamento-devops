provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "jenkins" {
  subnet_id                   = "subnet-0c400441905918ceb"
  ami                         = "ami-035bebdd93770d11c"
  instance_type               = "t2.large"
  key_name                    = "kp-treinamento-itau-turma2-mariana"
  vpc_security_group_ids      = ["${aws_security_group.jenkins.id}"]
  associate_public_ip_address = true
  root_block_device {
    encrypted   = true
    volume_size = 30
  }
  tags = {
    Name = "jenkins-mariana"
  }
}

resource "aws_security_group" "jenkins" {
  name        = "acessos_jenkins"
  description = "acessos_jenkins inbound traffic"
  vpc_id      = "vpc-0b43a8b3bafbe5fe1"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
    {
      description      = "SSH from VPC"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null,
      security_groups : null,
      self : null
    },
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids  = null,
      security_groups : null,
      self : null,
      description : "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "jenkins-lab-mariana"
  }
}

# terraform refresh para mostrar o ssh
output "jenkins" {
  value = [
    "jenkins",
    "id: ${aws_instance.jenkins.id}",
    "private: ${aws_instance.jenkins.private_ip}",
    "public: ${aws_instance.jenkins.public_ip}",
    "public_dns: ${aws_instance.jenkins.public_dns}",
    "ssh -i /Users/marianapereira/Documents/CursoAWS/id_rsa ubuntu@${aws_instance.jenkins.public_dns}"
  ]
}
