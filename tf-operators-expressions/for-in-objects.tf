
#getting the name from object list
locals {
  names=[for name in var.object_list : name.name]
}

output "names" {
  value = local.names
}

#getting first name
locals {
  first_names = [for person in var.object_list : split(" ", person.name)[0]]
}

output "first_names" {
  value = local.first_names
}

#Getting keys from map list
locals {
  map_keys=[for key,value in var.map_list:key]
}

output "keys" {
  value = local.map_keys    
}