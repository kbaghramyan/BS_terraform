module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = var.cluster_name
  kubernetes_version = var.cluster_version

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  endpoint_private_access = var.cluster_endpoint_private_access
  endpoint_public_access  = var.cluster_endpoint_public_access

  eks_managed_node_groups = {
    default = {
      name           = var.node_group_name
      instance_types = var.instance_types
      subnet_ids     = var.node_subnet_ids

      min_size     = var.node_min_size
      max_size     = var.node_max_size
      desired_size = var.node_desired_size

      disk_size                         = var.node_disk_size
      ami_type                          = var.node_ami_type
      capacity_type                     = var.node_capacity_type
      
    }
  }

  tags = var.tags
}

