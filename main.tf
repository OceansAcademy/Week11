terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow internal web traffic on port 8080"

  ingress {
    description = "Allow internal TCP traffic on port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
