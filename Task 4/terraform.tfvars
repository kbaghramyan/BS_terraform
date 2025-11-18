
project_name = "hotel-management"
region       = "us-east-1"
vpc_cidr     = "10.0.0.0/16"

public_subnet_1_cidr = "10.0.1.0/24"
public_subnet_2_cidr = "10.0.2.0/24"
availability_zone_1  = "us-east-1a"
availability_zone_2  = "us-east-1b"

instance_type = "t3.micro"
key_name      = "My-Web"
my_ip         = "83.139.19.192/32"

db_name     = "hotel-db"
db_username = "admin"


user_data = <<-EOF
#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo apt install awscli -y
sudo usermod -aG docker $USER
sudo systemctl start docker
sudo systemctl enable docker
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
REGION="us-east-1"
REPO_NAME="hotel-management"
IMAGE_TAG="latest"

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
docker run -d -p 80:80 --restart always $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
EOF

asg_min_size           = 1
asg_max_size           = 4
asg_desired_capacity   = 2
cpu_target_utilization = 80
