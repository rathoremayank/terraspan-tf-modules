terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# Get the latest Amazon Linux 2 AMI if not provided
data "aws_ami" "amazon_linux_2" {
  count       = var.ami_id == "" ? 1 : 0
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

# EC2 Instance
resource "aws_instance" "main" {
  ami                    = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2[0].id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = true

    tags = merge(
      var.tags,
      {
        Name = var.instance_name != "" ? "${var.instance_name}-root" : "${var.project_name}-root-${var.environment}"
      }
    )
  }

  user_data = var.user_data != "" ? var.user_data : null

  tags = merge(
    var.tags,
    {
      Name = var.instance_name != "" ? var.instance_name : "${var.project_name}-instance-${var.environment}"
    }
  )

  lifecycle {
    ignore_changes = [ami]
  }
}
