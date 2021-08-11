data "aws_caller_identity" "current" {}

locals {
  account_name = var.account_name == "" ? {} : {
    Account_Name = var.account_name
  }

  application = var.application == "" ? {} : {
    Application = var.application
  }

  app_version = var.application_version == "" ? {} : {
    Application-Version = var.application_version
  }

  business_owner = var.business_owner == "" ? {} : {
    Business-Owner = var.business_owner
  }

  classification = var.classification == "" ? {} : {
    Classification-Level = var.classification
  }

  common_tags = {
    Managed-By  = "terraform",
    Creator-ARN = data.aws_caller_identity.current.arn,
    Creator-ID  = data.aws_caller_identity.current.account_id
  }

  cost_center = var.cost_center == "" ? {} : {
    Cost-Center = var.cost_center
  }

  data = var.data == "" ? {} : {
    Source-Data = var.data
  }

  docs = var.documentation == "" ? {} : {
    Documentation = var.documentation
  }

  env = var.environment == "" ? {} : {
    Source-Environment = var.environment
  }

  name = var.name == "" ? {} : {
    Name = var.name
  }

  origin = var.origin == "" ? {} : {
    Origin = var.origin
  }

  os = var.os == "" ? {} : {
    OS = var.os
  }

  os_version = var.os_version == "" ? {} : {
    OS-Version = var.os_version
  }

  project = var.project == "" ? {} : {
    Project = var.project
  }

  service = var.service == "" ? {} : {
    Service = var.service
  }

  source_ami = var.source_ami == "" ? {} : {
    Source-AMI = var.source_ami
  }

  sub_env = var.sub_env == "" ? {} : {
    Sub-Environment = var.sub_env
  }

  type = var.type == "" ? {} : {
    Type = var.type
  }

  update_frequency = var.update_frequency == "" ? {} : {
    Update-Frequency = var.update_frequency
  }

  github_repo = var.github_repo == "" ? {} : {
    GitHub-Repo = var.github_repo
  }

  github_org = var.github_org == "" ? {} : {
    GitHub-Org = var.github_org
  }

}

locals {
  tags = merge(
  var.extra_tags,
  local.account_name,
  local.application,
  local.app_version,
  local.business_owner,
  local.classification,
  local.common_tags,
  local.cost_center,
  local.data,
  local.docs,
  local.env,
  local.name,
  local.origin,
  local.os,
  local.os_version,
  local.project,
  local.service,
  local.source_ami,
  local.sub_env,
  local.type,
  local.update_frequency,
  local.github_org,
  local.github_repo
  )
}

locals {
  tags_as_list_of_maps = [for key, value in local.tags : merge({key = key, value = value }, var.additional_tag_maps)]
}
