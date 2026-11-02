
output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.capstone_server.id
}

output "public_ip" {
  description = "Public IP address of the EC2 server"
  value       = aws_instance.capstone_server.public_ip
}

output "public_dns" {
  description = "Public DNS name of the EC2 server"
  value       = aws_instance.capstone_server.public_dns
}

output "ssh_command" {
  description = "SSH connection command"
  value       = "ssh -i capstone-project-key.pem ec2-user@${aws_instance.capstone_server.public_ip}"
}
