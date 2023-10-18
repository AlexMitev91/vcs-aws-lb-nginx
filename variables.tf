variable "ec2_ami"{
    description = "The provisioning image. Must have the application pre-built into the image"
    default = "ami-02c8e84c074bee888"
}

variable "instance_type"{
    description = "Instace type for the EC2 instance"
    default = "t2.micro"
}

variable "app_port"{
    description = "The port on which the app will be running"
    default = "80"
}

variable "app_protocol"{
    description = "The protocol on which the app will be running"
    default = "HTTP"
}

variable "cidr_block"{
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"
}

variable "private_subnet_cidr"{
    description = "CIDR block for the private NAT used by the EC2 instance"
    default = "10.0.1.0/24"
}

variable "public_subnet_cidr_1"{
    description = "CIDR block for the LB"
    default = "10.0.2.0/24"
}

variable "public_subnet_cidr_2"{
    description = "CIDR block for the LB"
    default = "10.0.3.0/24"
}

variable "private_az"{
    description = "Defines an AZ for the private network used by the EC2 instance"
    default = "us-east-1a"
}

variable "public_az1"{
    description = "Defines an AZ for the LB. Must be in a different zone than *public_az2*"
    default = "us-east-1a"
}

variable "public_az2"{
    description = "Defines an AZ for the LB. Must be in a different zone than *public_az1*"
    default = "us-east-1b"
}

variable "cidr_block_allow" {
  description = "Default value allows access to everyone on the specified port in 'app_port'"
  default = "0.0.0.0/0"
}
