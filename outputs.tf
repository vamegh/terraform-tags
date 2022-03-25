output "tags" {
  value       = local.tags_output
  description = "Normalized tag map"
}

output "k8s_labels" {
  value       = local.k8s_labels_output
  description = "Tags normalized for consumption by K8S/EKS as labels"
}

output "tags_as_list" {
  value       = local.tags_as_list_of_maps
  description = "Tags as list of maps, mainly used for asgs"
}
