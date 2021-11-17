provider "aws" {
  region = "sa-east-1"
}

module "criar-instancia-mariana" {
  source = "./Mariana"
  nome = "instancia-mariana"
}

