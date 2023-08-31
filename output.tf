output "InstanceId" {
  value = aws_instance.ec2_instance.id
}

output "PublicIpAddress" {
  value = aws_instance.ec2_instance.public_ip
}

output "PrivateKey" {
  value       = tls_private_key.private_key.private_key_pem
  sensitive   = true
  description = "Private key for SSH access"
}