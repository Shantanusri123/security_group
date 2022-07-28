resource "aws_security_group" "dev_sg"{
  name = "dev_sg"
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
    Name = "Dev_sg"
  }
  
}
output "dev_sg_id"{
  value = aws_security_group.dev_sg.id
}
