variable "arquivos" {
  default     = {
    arquivo1 = "ec2-mariana-tf-1",
    arquivo2 = "ec2-mariana-tf-2",
    arquivo3 = "ec2-mariana-tf-3"
  }
}

provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "web" {
  count = length(keys(var.arquivos))
  subnet_id = "subnet-02a9fe6e7889f4903"
  ami= "ami-0e66f5495b4efdd0f"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  root_block_device {
    encrypted = true
    volume_size = 30
  }
  tags = {
    Name = var.arquivos[keys(var.arquivos)[count.index]]
  }
}