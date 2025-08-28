output "ec2_public_ip" {
    value = aws_instance.my_instance[*].public_ip
}

output "ec2_public_dns" {
    value = aws_instance.my_instance[*].public_dns
}

output "en2_private_ip" {
    value = aws_instance.my_instance[*].private_ip
# with [*] it multiple instances output but without it only one instance output
  
}

output "ec2_private_dns" {
    value = aws_instance.my_instance[*].private_dns
}

#when used for_each
#output "ec2_public_ip" {
#    value = [
#for key/instance in aws_instance.my_instance : key/instance.public_ip
#]
#}
