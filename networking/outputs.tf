output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "subnet_id" {
  description = "The ID of the private subnet"
  value       = aws_subnet.private.id
}

output "subnet_cidr" {
  description = "The CIDR block of the private subnet"
  value       = aws_subnet.private.cidr_block
}

output "route_table_id" {
  description = "The ID of the private route table"
  value       = aws_route_table.private.id
}

output "security_group_id" {
  description = "The ID of the private security group"
  value       = aws_security_group.private.id
}

output "security_group_name" {
  description = "The name of the private security group"
  value       = aws_security_group.private.name
}

output "availability_zone" {
  description = "The availability zone of the subnet"
  value       = aws_subnet.private.availability_zone
}
