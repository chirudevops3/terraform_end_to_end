variable "type" {
  type = map(string)
  default = {
    "ap-south-1" = "t2.micro"
    "us-east-1"  = "t2.nano"
  }
}