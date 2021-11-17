terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  subnet_id = "subnet-0c400441905918ceb"
  ami= "ami-035bebdd93770d11c"
  instance_type = "t2.micro" 
  vpc_security_group_ids = ["sg-0bff3eec927fca337"] 
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
}