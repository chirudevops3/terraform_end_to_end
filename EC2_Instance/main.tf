provider "aws" {
    region = "ap-south-1"  # Set your desired AWS region
}

resource "aws_instance" "example" {
    ami           = "ami-0f58b397bc5c1f2e8"  # Specify an appropriate AMI ID
    instance_type = "t2.micro"
    tags = {
        Name = "newterra"
    }
}
resource "aws_eip" "eip" {
  #  instance = aws_instance.example.id
    domain = "vpc"
}
resource "aws_eip_association" "ip" {
  instance_id = aws_instance.example.id
  allocation_id = aws_eip.eip.id
}
output "ec2_publicip" {
    value = aws_instance.example.public_ip
}
output "ec2_id" {
    value = aws_instance.example.id
}
output "eip_id" {
    value = aws_eip_association.ip.id
}