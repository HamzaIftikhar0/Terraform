variable "ec2_instance_type" {
    description = "Type of instance to use"
    default     = "t2.micro"
    type        = string
  
}

variable "ec2_defaut_root_storage_size" {
    description = "Root storage size in GB"
    default     = 8
    type = number
}

variable "ec2_ami_id"{
    default = "ami-0b016c703b95ecbe4" #amazon linux 2 in us-east-2
    type = string
}

variable "env" {
    default =  "default" # other values can be "prod", "dev", "staging"
    type = string
  
}