locals {
  tags = defaults(var.tags, {
    account_name        = ""
    application         = ""
    app_version         = ""
    application_version = ""
    business_owner      = ""
    classification      = ""
    common_tags         = ""
    cost_center         = ""
    data                = ""
    docs                = ""
    documentation       = ""
    env_id              = ""
    env_name            = ""
    env_type            = ""
    zone_name           = ""
    sub_env             = ""
    name                = ""
    origin              = ""
    os                  = ""
    os_version          = ""
    project             = ""
    service             = ""
    source_ami          = ""
    type                = ""
    update_frequency    = ""
    github_org          = ""
    github_repo         = ""
  })

  creator_arn_list = split("/", data.aws_caller_identity.current.arn)
  creator_email    = element(local.creator_arn_list, length(local.creator_arn_list)-1)
  creator_name     = element(split("@", local.creator_email), 0)
}

locals {
  account_name = local.tags.account_name == "" ? {} : {
    AccountName = local.tags.account_name
  }

  application = local.tags.application == "" ? {} : {
    Application = local.tags.application
  }

  app_version_alt = local.tags.app_version == "" ? {} : {
    ApplicationVersion = local.tags.app_version
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
    ManagedBy    = "terraform",
    CreatorArn   = data.aws_caller_identity.current.arn,
    CreatorEmail = local.creator_email
    CreatorName  = local.creator_name
    AccountId    = data.aws_caller_identity.current.account_id
  }

  common_labels = {
    ManagedBy   = "terraform",
    CreatorName = local.creator_name
    AccountId   = data.aws_caller_identity.current.account_id
  }

  cost_center = local.tags.cost_center == "" ? {} : {
    CostCenter = local.tags.cost_center
  }

  data = local.tags.data == "" ? {} : {
    SourceData = local.tags.data
  }

  docs_alt = local.tags.docs == "" ? {} : {
    Documentation = local.tags.docs
  }

  docs = local.tags.documentation == "" ? {} : {
    Documentation = local.tags.documentation
  }

  env_id = local.tags.env_id == "" ? { EnvId = format("%s-%s", local.tags.env_name, local.tags.sub_env) } : {
    EnvId = local.tags.env_id
  }

  env_name = local.tags.env_name == "" ? {} : {
    EnvName = local.tags.env_name
  }

  env_type = local.tags.env_type == "" ? {} : {
    EnvType = local.tags.env_type
  }

  zone_name = local.tags.zone_name == "" ? {} : {
    ZoneName = local.tags.zone_name
  }

  sub_env = local.tags.sub_env == "" ? {} : {
    SubEnvironment = local.tags.sub_env
  }

  name = local.tags.name == "" ? {} : {
    Name = local.tags.name
  }

  origin = local.tags.origin == "" ? {} : {
    Origin = local.tags.origin
  }

  os = local.tags.os == "" ? {} : {
    Os = local.tags.os
  }

  os_version = local.tags.os_version == "" ? {} : {
    OsVersion = local.tags.os_version
  }

  project = local.tags.project == "" ? {} : {
    Project = local.tags.project
  }

  service = local.tags.service == "" ? {} : {
    Service = local.tags.service
  }

  source_ami = local.tags.source_ami == "" ? {} : {
    SourceAmi = local.tags.source_ami
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
    local.account_name,
    local.application,
    local.app_version_alt,
    local.app_version,
    local.business_owner,
    local.classification,
    local.common_tags,
    local.cost_center,
    local.data,
    local.docs_alt,
    local.docs,
    local.env_id,
    local.env_name,
    local.env_type,
    local.zone_name,
    local.sub_env,
    local.name,
    local.origin,
    local.os,
    local.os_version,
    local.project,
    local.service,
    local.source_ami,
    local.type,
    local.update_frequency,
    local.github_org,
    local.github_repo,
    var.extra_tags
  )

  labels_output = merge(
    local.account_name,
    local.application,
    local.app_version_alt,
    local.app_version,
    local.business_owner,
    local.classification,
    local.common_labels,
    local.cost_center,
    local.data,
    local.env_id,
    local.env_name,
    local.env_type,
    local.zone_name,
    local.sub_env,
    local.name,
    local.origin,
    local.os,
    local.os_version,
    local.project,
    local.service,
    local.source_ami,
    local.type,
    local.update_frequency,
    local.github_org,
    var.extra_tags
  )
}

locals {
  k8s_labels_sort      = { for key, value in local.labels_output : key => replace(value, replace("/", "/^//", ""), "") }
  k8s_labels_output    = { for key, value in local.k8s_labels_sort : key => value if length(value) < 63 }
  tags_as_list_of_maps = [for key, value in local.tags_output : merge({ key = key, value = value }, var.additional_tag_maps)]
}
