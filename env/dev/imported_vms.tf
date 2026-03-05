# AUTO-GENERATED - Migrate these to locals.tf when ready
locals {
  imported_vms = {
    mock-server-1 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-1"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {
        "-dev-sdb" = {
          size = 1024
          volume_type = "gp3"
          encrypted = true
          device_name = "/dev/sdb"
        }
      }
    }
    mock-server-2 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-2"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-3 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-3"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-4 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-4"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-5 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-5"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-6 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-6"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-7 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-7"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-8 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-8"
        Project = "clik-reconciler"
        Platform = "linux"
        Environment = "dev"
        ManagedBy = "Terraform"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-9 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-9"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-10 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-10"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-11 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-11"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-12 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-12"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-13 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-13"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-14 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-14"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-15 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-15"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-16 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-16"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-17 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-17"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-18 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-18"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-19 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-19"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-20 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-20"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
        gss-production = "true"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-21 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-21"
        Project = "clik-reconciler"
        Platform = "linux"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-22 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-22"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-23 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-23"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-24 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-24"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-25 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-25"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-26 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-26"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-27 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-27"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-28 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-28"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-29 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-29"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-30 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-30"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-31 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-31"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-32 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-32"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-33 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-33"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-34 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-34"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-35 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-35"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-36 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-36"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-37 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-37"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-38 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-38"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-39 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-39"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-40 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-40"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-41 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-41"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-42 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-42"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-43 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-43"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-44 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-44"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-45 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-45"
        Platform = "linux"
        Environment = "dev"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-46 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-46"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-47 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-47"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-48 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-48"
        Platform = "linux"
        Environment = "dev"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-49 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-49"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-50 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-50"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-51 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-51"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-52 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-52"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-53 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-53"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-54 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-54"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-55 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-55"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-56 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-56"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-57 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-57"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-58 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-58"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-59 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-59"
        Platform = "linux"
        ManagedBy = "Terraform"
        Environment = "dev"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-60 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-60"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-61 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-61"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-62 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-62"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-63 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-63"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-64 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-64"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-65 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-65"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-66 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-66"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-67 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-67"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-68 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-68"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-69 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-69"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-70 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-70"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-71 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-71"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-72 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-72"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-73 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-73"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-74 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-74"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-75 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-75"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-76 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-76"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-77 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-77"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-78 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-78"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-79 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-79"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-80 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-80"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-81 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-81"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-82 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-82"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-83 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-83"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-84 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-84"
        Platform = "linux"
        Environment = "dev"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-85 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-85"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-86 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-86"
        Environment = "dev"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-87 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-87"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-88 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-88"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-89 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-89"
        Platform = "linux"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-90 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-90"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-91 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-91"
        Project = "clik-reconciler"
        Environment = "dev"
        Platform = "linux"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-92 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-92"
        Platform = "linux"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-93 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-93"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-94 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-94"
        ManagedBy = "Terraform"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-95 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-95"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Environment = "dev"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-96 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-96"
        Environment = "dev"
        Project = "clik-reconciler"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-97 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-97"
        ManagedBy = "Terraform"
        Platform = "linux"
        Environment = "dev"
        Project = "clik-reconciler"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-98 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-98"
        Platform = "linux"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-99 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-99"
        Project = "clik-reconciler"
        Environment = "dev"
        ManagedBy = "Terraform"
        Platform = "linux"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
    mock-server-100 = {
      ami = "ami-12345678"
      instance_type = "t2.micro"
      subnet_id = "subnet-0a4b688ef05dc14ef"
      security_group_ids = []
      key_name = ""
      iam_instance_profile = ""
      tags = {
        Name = "mock-server-100"
        ManagedBy = "Terraform"
        Project = "clik-reconciler"
        Platform = "linux"
        Environment = "dev"
      }
      platform = "linux"
      root_volume = {
        size = 8
        volume_type = "gp2"
        encrypted = false
      }
      ebs_volumes = {}
    }
  }
}
