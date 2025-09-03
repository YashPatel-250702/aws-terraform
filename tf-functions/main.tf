
terraform {}

locals {
  value="Hello World"
}

variable "server_list" {
   type = list(string)
   default = [ "server1", "server2" ,"server3","server1"]
}

#lower case
output "name" {
  value = upper(local.value)
}

#length
output "length" {
  value = length(local.value)
}

#starts with
output "startsWith" {
  value=startswith(local.value,var.server_list[0])
}

#max number
output "max_number" {
  value=max(1,2,3,4,5)
  
}

#join
output "join" {
  value = join(": ", var.server_list)   
}

#contains
output "contains" {
  value = contains(var.server_list, "server1")
}

#convert into set

output "set" {
  value = toset(var.server_list)
  
}