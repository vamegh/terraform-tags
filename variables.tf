variable "account_name" {
  type    = string
  default = ""
}

variable "application" {
  type    = string
  default = ""
}

variable "application_version" {
  type    = string
  default = ""
}

variable "business_owner" {
  type    = string
  default = ""
}

variable "classification" {
  type    = string
  default = ""
}

variable "cost_center" {
  type    = string
  default = ""
}

variable "data" {
  type    = string
  default = ""
}

variable "documentation" {
  type    = string
  default = ""
}

variable "environment" {
  type    = string
  default = ""
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Extra / custom tags to include with tagging output"
}

variable "github_org" {
  type    = string
  default = ""
}

variable "github_repo" {
  type    = string
  default = ""
}

variable "name" {
  type    = string
  default = ""
}

variable "origin" {
  type    = string
  default = ""
}

variable "os" {
  description = "Acceptable values: Linux | Windows"
  default     = ""
}

variable "os_version" {
  description = "Version of the OS. Examples: 2012R2, 17.04, 2017.5.19"
  default     = ""
}

variable "project" {
  description = "Project Name This Service / Resource Belongs to"
  default     = ""
}

variable "service" {
  type    = string
  default = ""
}

variable "source_ami" {
  description = "AMI ID of the source AMI that this AMI was built from"
  default     = ""
}

variable "sub_env" {
  description = "Sub-Environment"
  default     = ""
}

variable "type" {
  type    = string
  default = ""
}

variable "update_frequency" {
  type    = string
  default = ""
}

variable "additional_tag_maps" {
  type        = map(string)
  default     = {}
  description = "Additional tags to add to list of maps output expected format: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group#example-usage" 
}

