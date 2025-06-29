# Terraform tagging module v1.0.0

This is a tagging module for both aws and Kubernetes resources 

Updated to work with optionals, which was released in tf 1.3.0
This module should deal with tagging aws resources and K8S labels,

please look at variables.tf to see the various tags it looks for,
the environments / sub-environments / environment type has a few
options, an "id" is generated based on environment name, sub-environment
and environment type, so you could have a 3 tiered tagged environment in 1
account. 

To actually use this I would suggest sharing the static tags between the
various files via a tfvars (symlinking?), which would reduce the number
of times the same static content is set across different environments /
accounts.
