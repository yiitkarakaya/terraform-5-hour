# Pull outputs of VPC from S3
data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket = "terraform-backend-for-startup"
    key    = "us-east-1/vpc"
    region = "us-east-1"
  }
}

# Print outputs from s3
output "full_list" {
	value = data.terraform_remote_state.main.outputs.*
}

module asg {
    source = "farrukh90/asgroup/aws"
    region           = "us-east-1"
    name_prefix      = "foobar"
    image_id         = "ami-0022f774911c1d690"
    instance_type    = "t2.micro"
    desired_capacity = 1
    max_size         = 99
    min_size         = 1
    subnets          = [
        data.terraform_remote_state.main.outputs.public_subnet1,
        data.terraform_remote_state.main.outputs.public_subnet2,
        data.terraform_remote_state.main.outputs.public_subnet3,
    ]
    tags = {
    Name = "main"
    }
}