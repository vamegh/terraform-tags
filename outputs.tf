output "tags" {
  value       = local.tags_output
  description = "Normalized Tag Map"
}

output "tags_as_list" {
  value       = local.tags_as_list_of_maps
  description = "Tags as list of Maps, mainly used for asgs"
}
