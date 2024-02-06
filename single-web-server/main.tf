provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0c24ee2a1e3b9df45"
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-server"
    }
}