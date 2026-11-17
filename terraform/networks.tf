module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"
  name    = "terraform-vpc"
  cidr    = "10.0.0.0/16"

  azs            = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_vpn_gateway      = false
  enable_dns_hostnames    = true
  enable_dns_support      = true
  create_igw              = true
  map_public_ip_on_launch = true
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "terraform-sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "reglas-api-main-py"
  description = "security group para las API main"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]

  ingress_rules = ["https-443-tcp", "ssh-tcp", "http-8080-tcp"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]
}
