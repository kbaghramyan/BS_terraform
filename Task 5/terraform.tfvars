
region       = "us-east-1"
project_name = "hotel-management"

vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
azs                 = ["us-east-1a", "us-east-1b"]


iam_instance_profile_name = "EC2ECRInstanceProfile-1"
iam_role_name             = "EC2ECRReadOnly"
instance_type             = "t3.micro"
key_name                  = "My-Web"
my_ip                     = "87.241.159.153/32"
db_name                   = "hotel-db"
db_username               = "admin"
db_publicly_accessible    = true


user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo apt install -y awscli
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
sudo systemctl start docker

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION="us-east-1"
REPO_NAME="hotel-management"
IMAGE_TAG="latest"

aws ecr get-login-password --region $REGION \
  | docker login --username AWS --password-stdin \
    $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG

docker run -d -p 80:80 --restart always \
  $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
EOF

asg_min_size           = 1
asg_max_size           = 4
asg_desired_capacity   = 2
cpu_target_utilization = 80
