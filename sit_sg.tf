resource "aws_security_group" "sit_sg"{
  name = "sit_sg"
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags{
    Name = "sit_sg"
  }
  
}

output "sit_sg_id"{
  value = aws_security_group.sit_sg.id
}