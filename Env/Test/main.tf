provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source         = "../../modules/vpc"
  vpc_cidr       = "10.0.0.0/16"
  vpc_name       = "test-vpc"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs= ["10.0.3.0/24", "10.0.4.0/24"]
  azs            = ["ap-south-1a", "ap-south-1b"]
}

module "sg" {
  source  = "../../modules/security_groups"
  vpc_id  = module.vpc.vpc_id
  sg_name = "wordpress-sg"
}

module "ec2" {
  source         = "../../modules/ec2"
  ami_id         = "ami-018046b953a698135" # Update with latest Amazon Linux or Ubuntu
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.public_subnet_ids[0]
  sg_id          = module.sg.security_groups_id
  key_name       = "ec2" # Your EC2 KeyPair
  instance_name  = "wordpress-ec2"
}

module "rds" {
  source             = "../../modules/rds"

  project            = "test"
  db_user            = "admin"
  db_password        = "Password123!"
  db_name            = "wordpress"
  db_instance_class  = "db.t3.micro"
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group     = module.sg.security_groups_id
  allocated_storage  = 20
}
