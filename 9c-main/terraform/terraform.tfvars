# eks cluster
name = "9c-main-v2"

create_vpc = true

# new vpc
vpc_name       = "9c-main"
vpc_cidr_block = "10.0.0.0/16"
public_subnets = {
  "us-east-2a" = "10.0.0.0/20"
  "us-east-2b" = "10.0.16.0/20"
  "us-east-2c" = "10.0.32.0/20"
}
private_subnets = {
  "us-east-2a" = "10.0.128.0/20"
  "us-east-2b" = "10.0.144.0/20"
  "us-east-2c" = "10.0.160.0/20"
}

# node group
node_groups = {
  "9c-main-m5_l_2c" = {
    instance_types    = ["m5.large"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 3
    min_size          = 0
    max_size          = 12
  }

  "9c-main-r7g_xl_2c" = {
    instance_types    = ["r7g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 1
    min_size          = 0
    max_size          = 2
    ami_type          = "AL2_ARM_64"
  }

  "9c-main-m7g_xl_2c" = {
    instance_types    = ["m7g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 1
    min_size          = 0
    max_size          = 6
    ami_type          = "AL2_ARM_64"
  }

  "9c-main-m7g_2xl_2c_test" = {
    instance_types    = ["m7g.2xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 8
    min_size          = 4
    max_size          = 15
    ami_type          = "AL2_ARM_64"
    disk_size         = 50
    taints = [{
      key    = "dedicated"
      value  = "remote-headless-test"
      effect = "NO_SCHEDULE"
    }]
  }

  "9c-main-m7g_2xl_2c_validator" = {
    instance_types    = ["m7g.2xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 4
    min_size          = 4
    max_size          = 10
    ami_type          = "AL2_ARM_64"
    disk_size         = 50
    taints = [{
      key    = "dedicated"
      value  = "validator-test"
      effect = "NO_SCHEDULE"
    }]
  }

  "9c-main-r6g_xl_2c" = {
    instance_types    = ["r6g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 5
    min_size          = 0
    max_size          = 20
    ami_type          = "AL2_ARM_64"
  }

  "9c-main-t3_medium" = {
    instance_types    = ["t3.medium"]
    availability_zone = "us-east-2c"
    capacity_type     = "SPOT"
    desired_size      = 1
    min_size          = 0
    max_size          = 1
  }

  "heimdall-m5_l_2c" = {
    instance_types    = ["m5.large"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 3
    min_size          = 0
    max_size          = 12
  }

  "heimdall-r7g_xl_2c" = {
    instance_types    = ["r7g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 1
    min_size          = 0
    max_size          = 2
    ami_type          = "AL2_ARM_64"
  }

  "heimdall-m7g_xl_2c" = {
    instance_types    = ["m7g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 1
    min_size          = 0
    max_size          = 6
    ami_type          = "AL2_ARM_64"
  }

  "heimdall-m7g_2xl_2c_test" = {
    instance_types    = ["m7g.2xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 4
    min_size          = 4
    max_size          = 15
    ami_type          = "AL2_ARM_64"
    disk_size         = 50
    taints = [{
      key    = "dedicated"
      value  = "remote-headless-test"
      effect = "NO_SCHEDULE"
    }]
  }

  "heimdall-m7g_2xl_2c_validator" = {
    instance_types    = ["m7g.2xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 1
    min_size          = 1
    max_size          = 6
    ami_type          = "AL2_ARM_64"
    disk_size         = 50
    taints = [{
      key    = "dedicated"
      value  = "validator-test"
      effect = "NO_SCHEDULE"
    }]
  }

  "heimdall-r6g_xl_2c" = {
    instance_types    = ["r6g.xlarge"]
    availability_zone = "us-east-2c"
    capacity_type     = "ON_DEMAND"
    desired_size      = 3
    min_size          = 0
    max_size          = 20
    ami_type          = "AL2_ARM_64"
  }

  "general-t3_medium" = {
    instance_types    = ["t3.medium"]
    availability_zone = "us-east-2c"
    capacity_type     = "SPOT"
    desired_size      = 1
    min_size          = 0
    max_size          = 1
  }
}
