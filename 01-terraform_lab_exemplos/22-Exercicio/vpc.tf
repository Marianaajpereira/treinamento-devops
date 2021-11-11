# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.100.0.0/16" # uma classe de IP
  
  tags = {
    Name = "tf-lab-mariama-vpc"
  }
}

resource "aws_subnet" "subnet-1a-mariana" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.100.16.0/20"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-lab-mariana-subnet_1a"
  }
}

resource "aws_subnet" "subnet-1b-mariana" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.100.32.0/20"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-lab-mariana-subnet_1b"
  }
}

resource "aws_subnet" "subnet-1c-mariana" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.100.48.0/20"
  availability_zone = "us-east-1c"

  tags = {
    Name = "tf-lab-mariana-subnet_1c"
  }
}

resource "aws_subnet" "subnet-1d-mariana" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.100.80.0/20"
  availability_zone = "us-east-1d"

  tags = {
    Name = "tf-lab-mariana-subnet-private"
    }
  }

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "tf-mariana-int-gtw"
  }
}

resource "aws_route_table" "rt_terraform" {
  vpc_id = aws_vpc.my_vpc.id

  route = [
      {
        carrier_gateway_id         = ""
        cidr_block                 = "0.0.0.0/0"
        destination_prefix_list_id = ""
        egress_only_gateway_id     = ""
        gateway_id                 = aws_internet_gateway.gw.id
        instance_id                = ""
        ipv6_cidr_block            = ""
        local_gateway_id           = ""
        nat_gateway_id             = ""
        network_interface_id       = ""
        transit_gateway_id         = ""
        vpc_endpoint_id            = ""
        vpc_peering_connection_id  = ""
      }
  ]

  tags = {
    Name = "route_table_terraform"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.subnet-1a-mariana.id
  route_table_id = aws_route_table.rt_terraform.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.subnet-1b-mariana.id
  route_table_id = aws_route_table.rt_terraform.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.subnet-1c-mariana.id
  route_table_id = aws_route_table.rt_terraform.id
}
