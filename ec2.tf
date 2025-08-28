resource aws_key_pair deployer {
    key_name =  "terra-key-ec2"
    public_key = file("terra-key-ec2.pub")
}

resource aws_default_vpc default {

  
}

resource aws_security_group my_sg {
    name = "my-sg"
    description = "this is my security group"
    vpc_id = aws_default_vpc.default.id

    # Inbound rule
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH Open to the world"
    }
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port = 8000
        to_port = 8000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    #outbound rule
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow all outbound traffic"
    }
  
    tags = {
        Name = "my-sg"
    }


}
 resource "aws_instance" "my_instance" {
  #  for_each = tomap{
      #  "my_instance1" = "t2.micro"
        #"my_instance2" = "t2.micro"
        #"my_instance3" = "t2.micro"
   # }
    depends_on = [ aws_security_group.my_sg , aws_key_pair.deployer]
    count = 1 #meta-argument
    key_name = aws_key_pair.deployer.key_name
    security_groups = [ aws_security_group.my_sg.name ]
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami_id
    user_data = file ("install_nginx.sh")
    root_block_device {
        volume_size = var.env == "prod" ?  20 : var.ec2_defaut_root_storage_size
        volume_type = "gp3"
        delete_on_termination = true
    }
    tags = {
        Name = "my-instance"
        environment = var.env
    }
 }

 #if I have to import an existing instance I'LL USE THE BELOW CODE
# terraform import aws_instance.my_instance ami id
 #resource "aws_instance" "new_instance" {
  #  ami = "unknown"
# instance_type = "unknown"
#}