variable "additional_tag_maps" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to list of maps output expected format: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#example-usage"
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra / custom tags to include with tagging output"
}

variable "tags" {
  description = "A map of tags, the keys get formatted into PascalCase"
  type = object({
    account_name        = optional(string)
    application         = optional(string)
    app_version         = optional(string)
    application_version = optional(string)
    business_owner      = optional(string)
    classification      = optional(string)
    common_tags         = optional(string)
    cost_center         = optional(string)
    documentation       = optional(string)
    data                = optional(string)
    docs                = optional(string)
    env                 = optional(string)
    environment         = optional(string)
    name                = optional(string)
    origin              = optional(string)
    os                  = optional(string)
    os_version          = optional(string)
    project             = optional(string)
    service             = optional(string)
    source_ami          = optional(string)
    sub_env             = optional(string)
    type                = optional(string)
    update_frequency    = optional(string)
    github_org          = optional(string)
    github_repo         = optional(string)
  })
  default = {
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
    env                 = ""
    environment         = ""
    name                = ""
    origin              = ""
    os                  = ""
    os_version          = ""
    project             = ""
    service             = ""
    source_ami          = ""
    sub_env             = ""
    type                = ""
    update_frequency    = ""
    github_org          = ""
    github_repo         = ""
  }
}
