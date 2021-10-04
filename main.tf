data "aws_caller_identity" "current" {}

locals {
  account_name = var.account_name == "" ? {} : {
    AccountName = var.account_name
  }

  application = var.application == "" ? {} : {
    Application = var.application
  }

  app_version = var.application_version == "" ? {} : {
    ApplicationVersion = var.application_version
  }

  business_owner = var.business_owner == "" ? {} : {
    BusinessOwner = var.business_owner
  }

  classification = var.classification == "" ? {} : {
    ClassificationLevel = var.classification
  }

  common_tags = {
    ManagedBy  = "terraform",
    CreatorARN = data.aws_caller_identity.current.arn,
    CreatorID  = data.aws_caller_identity.current.account_id
  }

  cost_center = var.cost_center == "" ? {} : {
    CostCenter = var.cost_center
  }

  data = var.data == "" ? {} : {
    SourceData = var.data
  }

  docs = var.documentation == "" ? {} : {
    Documentation = var.documentation
  }

  env = var.environment == "" ? {} : {
    SourceEnvironment = var.environment
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
    OSVersion = var.os_version
  }

  project = var.project == "" ? {} : {
    Project = var.project
  }

  service = var.service == "" ? {} : {
    Service = var.service
  }

  source_ami = var.source_ami == "" ? {} : {
    SourceAMI = var.source_ami
  }

  sub_env = var.sub_env == "" ? {} : {
    SubEnvironment = var.sub_env
  }

  type = var.type == "" ? {} : {
    Type = var.type
  }

  update_frequency = var.update_frequency == "" ? {} : {
    UpdateFrequency = var.update_frequency
  }

  github_repo = var.github_repo == "" ? {} : {
    GitHubRepo = var.github_repo
  }

  github_org = var.github_org == "" ? {} : {
    GitHubOrg = var.github_org
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
