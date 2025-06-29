locals {
  creator_arn_list = split("/", data.aws_caller_identity.current.arn)
  creator_email    = element(local.creator_arn_list, length(local.creator_arn_list) - 1)
  creator_name     = element(split("@", local.creator_email), 0)

  env_name_set  = ( var.tags.env_name == "" ?
                    var.tags.environment : var.tags.env_name )
  env_sub_sort  = ( var.tags.sub_env == "" ?
                    var.tags.sub_environment : var.tags.sub_env )
  env_sub_set   = ( var.tags.env_sub == "" ?
                    local.env_sub_sort : var.tags.env_sub )
  env_type_set  = ( local.env_sub_set == "" ?
                    var.tags.env_type : 
                    "${var.tags.env_type}-${local.env_sub_set}" )

  env_id_set = local.env_type_set == "" ? {
    EnvId = local.env_name_set } : {
    EnvId = "${local.env_name_set}-${local.env_type_set}"
  }
}

locals {
  account_name = var.tags.account_name == "" ? {} : {
    AccountName = var.tags.account_name
  }

  application = var.tags.application == "" ? {} : {
    Application = var.tags.application
  }

  app_version_alt = var.tags.app_version == "" ? {} : {
    ApplicationVersion = var.tags.app_version
  }

  app_version = var.tags.application_version == "" ? {} : {
    ApplicationVersion = var.tags.application_version
  }

  business_owner = var.tags.business_owner == "" ? {} : {
    BusinessOwner = var.tags.business_owner
  }

  classification = var.tags.classification == "" ? {} : {
    ClassificationLevel = var.tags.classification
  }

  common_tags = {
    ManagedBy    = "terraform",
    CreatorArn   = data.aws_caller_identity.current.arn
    CreatorEmail = local.creator_email
    CreatorName  = local.creator_name
    AccountId    = data.aws_caller_identity.current.account_id
  }

  common_labels = {
    ManagedBy   = "terraform",
    CreatorName = local.creator_name
    AccountId   = data.aws_caller_identity.current.account_id
  }

  cost_center = var.tags.cost_center == "" ? {} : {
    CostCenter = var.tags.cost_center
  }

  data = var.tags.data == "" ? {} : {
    SourceData = var.tags.data
  }

  docs_alt = var.tags.docs == "" ? {} : {
    Documentation = var.tags.docs
  }

  docs = var.tags.documentation == "" ? {} : {
    Documentation = var.tags.documentation
  }

  environment = var.tags.environment == "" ? {} : {
    Environment = var.tags.environment
  }

  env_id = var.tags.env_id == "" ? local.env_id_set : {
    EnvId = var.tags.env_id
  }

  env_name = var.tags.env_name == "" ? {} : {
    EnvName = var.tags.env_name
  }

  env_sub = var.tags.env_sub == "" ? {} : {
    EnvSub = var.tags.env_sub
  }

  env_type = var.tags.env_type == "" ? {} : {
    EnvType = var.tags.env_type
  }

  sub_env = var.tags.sub_env == "" ? {} : {
    SubEnv = var.tags.sub_env
  }

  sub_environment = var.tags.sub_environment == "" ? {} : {
    SubEnvironment = var.tags.sub_environment
  }

  name = var.tags.name == "" ? {} : {
    Name = var.tags.name
  }

  origin = var.tags.origin == "" ? {} : {
    Origin = var.tags.origin
  }

  os = var.tags.os == "" ? {} : {
    Os = var.tags.os
  }

  os_version = var.tags.os_version == "" ? {} : {
    OsVersion = var.tags.os_version
  }

  project = var.tags.project == "" ? {} : {
    Project = var.tags.project
  }

  service = var.tags.service == "" ? {} : {
    Service = var.tags.service
  }

  source_ami = var.tags.source_ami == "" ? {} : {
    SourceAmi = var.tags.source_ami
  }

  type = var.tags.type == "" ? {} : {
    Type = var.tags.type
  }

  update_frequency = var.tags.update_frequency == "" ? {} : {
    UpdateFrequency = var.tags.update_frequency
  }

  github_repo = var.tags.github_repo == "" ? {} : {
    GitHubRepo = var.tags.github_repo
  }

  github_org = var.tags.github_org == "" ? {} : {
    GitHubOrg = var.tags.github_org
  }

  zone_name = var.tags.zone_name == "" ? {} : {
    ZoneName = var.tags.zone_name
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
    local.environment,
    local.env_id,
    local.env_name,
    local.env_sub,
    local.env_type,
    local.github_org,
    local.github_repo,
    local.name,
    local.origin,
    local.os,
    local.os_version,
    local.project,
    local.service,
    local.source_ami,
    local.sub_env,
    local.sub_environment,
    local.type,
    local.update_frequency,
    local.zone_name,
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
    local.docs_alt,
    local.docs,
    local.env_id,
    local.environment,
    local.env_name,
    local.env_sub,
    local.env_type,
    local.github_org,
    local.github_repo,
    local.name,
    local.origin,
    local.os,
    local.os_version,
    local.project,
    local.service,
    local.source_ami,
    local.sub_env,
    local.sub_environment,
    local.type,
    local.update_frequency,
    local.zone_name,
    var.extra_tags
  )
}

locals {
  k8s_labels_sort      = { for key, value in local.labels_output : key => replace(value, replace("/", "/^//", ""), "") }
  k8s_labels_output    = { for key, value in local.k8s_labels_sort : key => value if length(value) < 63 }
  tags_as_list_of_maps = [for key, value in local.tags_output : merge({ key = key, value = value }, var.additional_tag_maps)]
}
