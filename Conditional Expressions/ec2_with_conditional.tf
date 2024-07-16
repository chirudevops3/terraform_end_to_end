provider "aws" {

}

variable "env" {
  type = any
}

resource "aws_instance" "dev" {
  ami           = "ami-0cda377a1b884a1bc"
  instance_type = "t2.nano"
  count         = var.env == "dev" ? 1 : 0
}

resource "aws_instance" "prod" {
  ami           = "ami-0cda377a1b884a1bc"
  instance_type = "t2.micro"
  count         = var.env == "prod" ? 2 : 0
}