output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.main.id
}

output "instance_arn" {
  description = "The ARN of the EC2 instance"
  value       = aws_instance.main.arn
}

output "instance_private_ip" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.main.private_ip
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance (if associated)"
  value       = aws_instance.main.public_ip
}

output "instance_state" {
  description = "The current state of the instance"
  value       = aws_instance.main.instance_state
}

output "instance_availability_zone" {
  description = "The availability zone the instance is in"
  value       = aws_instance.main.availability_zone
}

output "instance_ami" {
  description = "The AMI ID used for the instance"
  value       = aws_instance.main.ami
}

output "primary_network_interface_id" {
  description = "The ID of the primary network interface"
  value       = aws_instance.main.primary_network_interface_id
}
