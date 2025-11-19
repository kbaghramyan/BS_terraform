data "aws_ami" "ubuntu_2204" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "subnets" {
  source = "./modules/subnets"

  vpc_id                = module.vpc.vpc_id
  public_subnet_cidrs   = var.public_subnet_cidrs
  azs                   = var.azs
  project_name          = var.project_name
  public_route_table_id = module.vpc.public_rt_id
}

module "security_groups" {
  source             = "./modules/security_groups"
  vpc_id             = module.vpc.vpc_id
  project_name       = var.project_name
  instance_ssh_cidrs = var.my_ip
  rds_extra_cidrs    = [var.my_ip]
}

module "rds" {
  source                 = "./modules/rds"
  project_name           = var.project_name
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  subnet_ids             = module.subnets.public_subnet_ids
  rds_sg_id              = module.security_groups.rds_sg_id
  db_publicly_accessible = var.db_publicly_accessible
}

resource "null_resource" "import_sql" {
  depends_on = [module.rds]

  provisioner "local-exec" {
    command = "mysql -h ${module.rds.rds_endpoint} -u ${module.rds.rds_username} -p${module.rds.rds_password} < ./bluebirdhotel.sql"
  }
}

module "alb" {
  source       = "./modules/alb"
  project_name = var.project_name
  subnets      = module.subnets.public_subnet_ids
  alb_sg_id    = module.security_groups.alb_sg_id
}

module "compute" {
  source = "./modules/compute"

  project_name              = var.project_name
  image_id                  = data.aws_ami.ubuntu_2204.id
  instance_type             = var.instance_type
  key_name                  = var.key_name
  user_data                 = var.user_data
  instance_sg_id            = module.security_groups.instance_sg_id
  iam_instance_profile_name = var.iam_instance_profile_name
  iam_role_name             = var.iam_role_name

  asg_min_size           = var.asg_min_size
  asg_max_size           = var.asg_max_size
  asg_desired_capacity   = var.asg_desired_capacity
  cpu_target_utilization = var.cpu_target_utilization
  subnets                = module.subnets.public_subnet_ids
  target_group_arn       = module.alb.tg_arn
}

