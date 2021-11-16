variable "subnet" {
  type        = string
  description = "Informe a subnet."
  validation {
    condition     = substr(var.subnet, 0, 7) == "subnet-"
    error_message = "O valor do subnet não é válido, tem que começar com \"subnet-\"."
  }
}
variable "ami" {
  type        = string
  description = "Informe a ami."
  validation {
    condition     = substr(var.ami, 0, 4) == "ami-"
    error_message = "O valor do ami não é válido, tem que começar com \"ami-\"."
  }
}
variable "instance" {
  type        = string
  description = "Informe o tamanho a instancia."
  # validation {
  #   condition     = substr(var.instance, 0, 3) == "t2."
  #   error_message = "O tamanho da instancia não é válido, tem que começar com \"t2.\"."
  # }
}
variable "securityGroup" {
  type        = string
  description = "Informe o security group."
  validation {
    condition     = substr(var.securityGroup, 0, 3) == "sg-"
    error_message = "O valor do security group não é válido, tem que começar com \"sg-\"."
  }
}