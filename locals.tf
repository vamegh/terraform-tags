locals {
  tags = defaults(var.tags, {
    account_name     = ""
    application      = ""
    app_version      = ""
    business_owner   = ""
    classification   = ""
    common_tags      = ""
    cost_center      = ""
    data             = ""
    docs             = ""
    env              = ""
    name             = ""
    origin           = ""
    os               = ""
    os_version       = ""
    project          = ""
    service          = ""
    source_ami       = ""
    sub_env          = ""
    type             = ""
    update_frequency = ""
    github_org       = ""
    github_repo      = ""
  })
}

locals {
  account_name = local.tags.account_name == "" ? {} : {
    AccountName = local.tags.account_name
  }

  application = local.tags.application == "" ? {} : {
    Application = local.tags.application
  }

  app_version = local.tags.application_version == "" ? {} : {
    ApplicationVersion = local.tags.application_version
  }

  business_owner = local.tags.business_owner == "" ? {} : {
    BusinessOwner = local.tags.business_owner
  }

  classification = local.tags.classification == "" ? {} : {
    ClassificationLevel = local.tags.classification
  }

  common_tags = {
    ManagedBy  = "terraform",
    CreatorARN = data.aws_caller_identity.current.arn,
    CreatorID  = data.aws_caller_identity.current.account_id
  }

  cost_center = local.tags.cost_center == "" ? {} : {
    CostCenter = local.tags.cost_center
  }

  data = local.tags.data == "" ? {} : {
    SourceData = local.tags.data
  }

  docs = local.tags.documentation == "" ? {} : {
    Documentation = local.tags.documentation
  }

  env = local.tags.environment == "" ? {} : {
    SourceEnvironment = local.tags.environment
  }

  name = local.tags.name == "" ? {} : {
    Name = local.tags.name
  }

  origin = local.tags.origin == "" ? {} : {
    Origin = local.tags.origin
  }

  os = local.tags.os == "" ? {} : {
    OS = local.tags.os
  }

  os_version = local.tags.os_version == "" ? {} : {
    OSVersion = local.tags.os_version
  }

  project = local.tags.project == "" ? {} : {
    Project = local.tags.project
  }

  service = local.tags.service == "" ? {} : {
    Service = local.tags.service
  }

  source_ami = local.tags.source_ami == "" ? {} : {
    SourceAMI = local.tags.source_ami
  }

  sub_env = local.tags.sub_env == "" ? {} : {
    SubEnvironment = local.tags.sub_env
  }

  type = local.tags.type == "" ? {} : {
    Type = local.tags.type
  }

  update_frequency = local.tags.update_frequency == "" ? {} : {
    UpdateFrequency = local.tags.update_frequency
  }

  github_repo = local.tags.github_repo == "" ? {} : {
    GitHubRepo = local.tags.github_repo
  }

  github_org = local.tags.github_org == "" ? {} : {
    GitHubOrg = local.tags.github_org
  }
}

locals {
  tags_output = merge(
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
  tags_as_list_of_maps = [for key, value in local.tags_output : merge({ key = key, value = value }, var.additional_tag_maps)]
}
