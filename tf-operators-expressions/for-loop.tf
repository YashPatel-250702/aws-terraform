
#Double the value of the list

locals {
  Double = [for num in var.num_list : num * 2]
}

output "double" {
  value = local.Double
}

#get odd numbers
locals{
    odd=[for num in var.num_list: num if num%2!=0]
}

output "odd" {
  value = local.odd
}