provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  for_each = toset(["mariana","joao","maria"])
  subnet_id = "subnet-02a9fe6e7889f4903"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 8
  }
  tags = {
    Name = "ec2-tf-${each.key}"
  }
}
output "instance_public_dns" {
  value = [
    for key, item in aws_instance.web :
      "item.public_ip:${item.public_ip} - item.private_ip:${item.private_ip} - item.public_dns:${item.public_dns}"
  ]
  description = "Mostra o DNS e os IPs publicos e privados da maquina criada."
}