variable "additional_tag_maps" {
  description = "Additional tags to add to list of maps output expected format: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#example-usage"
  type        = map(string)
  default     = {}
}

variable "extra_tags" {
  description = "Extra / custom tags to include with tagging output"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags, the keys get formatted into PascalCase"
  type = object({
    name                = string
    account_name        = optional(string, "")
    application         = optional(string, "")
    app_version         = optional(string, "")
    application_version = optional(string, "")
    business_owner      = optional(string, "")
    classification      = optional(string, "")
    common_tags         = optional(string, "")
    cost_center         = optional(string, "")
    documentation       = optional(string, "")
    data                = optional(string, "")
    docs                = optional(string, "")
    environment         = optional(string, "")
    env_id              = optional(string, "")
    env_name            = optional(string, "")
    env_sub             = optional(string, "")
    env_type            = optional(string, "")
    github_org          = optional(string, "")
    github_repo         = optional(string, "")
    origin              = optional(string, "")
    os                  = optional(string, "")
    os_version          = optional(string, "")
    project             = optional(string, "")
    service             = optional(string, "")
    source_ami          = optional(string, "")
    sub_env             = optional(string, "")
    sub_environment     = optional(string, "")
    type                = optional(string, "")
    update_frequency    = optional(string, "")
    zone_name           = optional(string, "")
  })
}
