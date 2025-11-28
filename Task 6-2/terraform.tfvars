
region       = "us-east-1"
project_name = "hotel-management"

vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24"]
azs                  = ["us-east-1a", "us-east-1b"]
repository_name      = "hotel-management"


db_name                = "hotel-db"
db_username            = "admin"


cluster_version        = "1.32"
cluster_instance_type  = ["t3.small"]
node_desired_size      = 1
node_min_size          = 1
node_max_size          = 1