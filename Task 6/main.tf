module "network" {
  source               = "./modules/network"
  project_name         = var.project_name
  azs                  = var.azs
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security_groups" {
  source                      = "./modules/security_groups"
  vpc_id                      = module.network.vpc_id
  project_name                = var.project_name
  rds_allowed_security_groups = [module.eks.cluster_security_group_id]
}

module "rds" {
  source                 = "./modules/rds"
  project_name           = var.project_name
  db_name                = var.db_name
  db_username            = var.db_username
  db_password            = var.db_password
  subnet_ids             = module.network.private_subnet_ids
  rds_sg_id              = module.security_groups.rds_sg_id
  db_publicly_accessible = var.db_publicly_accessible
}

module "ecr" {
  source          = "./modules/ecr"
  project_name    = var.project_name
  repository_name = var.repository_name
}

module "eks" {
  source          = "./modules/eks"
  cluster_name    = "${var.project_name}-eks"
  cluster_version = "1.32"

 
  vpc_id     = module.network.vpc_id
  subnet_ids = concat(module.network.public_subnet_ids, module.network.private_subnet_ids)
  
  node_subnet_ids = module.network.private_subnet_ids

  instance_types    = ["t3.small"]
  node_desired_size = 1
  node_min_size     = 1
  node_max_size     = 1

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  tags = { 
    Environment = var.env
    Project     = var.project_name
  }
}
