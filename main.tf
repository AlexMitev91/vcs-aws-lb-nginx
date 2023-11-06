module "networking" {
  source  = "app.terraform.io/alex-mitev-onboard/networking/aws"
  version = "1.0.3"
  cidr_block = var.cidr_block
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr_1 = var.public_subnet_cidr_1
  public_subnet_cidr_2 = var.public_subnet_cidr_2
  private_az = var.private_az
  public_az1 = var.public_az1
  public_az2 = var.public_az2
}

module "lb" {
  source  = "app.terraform.io/alex-mitev-onboard/lb/aws"
  version = "1.0.0"
  vpc_id = module.networking.vpc_id

  aws_subnet1_id = module.networking.aws_subnet1_id
  aws_subnet2_id = module.networking.aws_subnet2_id

  ec2_id = module.ec2.ec2_id

  aws_security_group_id = module.sg.aws_security_group_id

  app_port = var.app_port
  app_protocol = var.app_protocol
}

module "sg" {
  source  = "app.terraform.io/alex-mitev-onboard/sg/aws"
  version = "1.0.0"
  vpc_id = module.networking.vpc_id
  cidr_block_allow = var.cidr_block_allow
  app_port = var.app_port
}

module "ec2" {
  source  = "app.terraform.io/alex-mitev-onboard/ec2/aws"
  version = "1.0.0"
  ec2_ami = var.ec2_ami
  instance_type = var.instance_type
  aws_private_subnet_id = module.networking.aws_private_subnet_id
  aws_security_group_id = module.sg.aws_security_group_id
}
