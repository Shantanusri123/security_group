data "terraform_remote_state" "security_group_info"{
  backend = "s3"
  config = {
    bucket               = "terraform-state-for-us"
    key                  = var.environment_key
    region  = var.aws_region
    profile = "aws_profile_dev"
  }
}

resource "aws_security_group" "sg"{
  name = var.name
  ingress{
    from_port = var.port
    to_port = var.port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = var.name
  }
  
}
output "sg_id"{
  value = aws_security_group.sg.id
}
