module "project_ec2" {
  source             = "./modules/ec2"
  instance_count     = var.instance_count
  name               = local.name
  account            = data.aws_caller_identity.current.account_id
  aws_ami            = "ami-013c4e06a44021d79"
  private_subnet_ids = data.terraform_remote_state.vpc.outputs.private_subnet_ids
  public_subnet_ids  = data.terraform_remote_state.vpc.outputs.public_subnet_ids
  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
}
