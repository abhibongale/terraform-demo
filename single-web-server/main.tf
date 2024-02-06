provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "demo-group-instance" {
    name = "terraform-demo-server"

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "demo-server" {
    ami = "ami-0c24ee2a1e3b9df45"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.demo-group-instance.id}"]
    user_data = <<-EOF
                #!/bin/bash
                echo "hello-world" > index.html
                nohup busybox httpd -f -p 8080 &
                EOF

    tags = {
        Name = "terraform-server"
    }
}