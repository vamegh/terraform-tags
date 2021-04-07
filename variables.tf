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
  description = "Extra tags to attach to the ACM certificate"
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


## Variables For ASG Tagging
variable "set_key_as_list" {
  type        = bool
  default     = false
  description = "Generate tags as a list of maps, for asgs mainly"
}

variable "additional_tag_maps" {
  type        = map(string)
  default     = {}
  description = "Additional tags to map to list of maps, for asgs mainly"
}

