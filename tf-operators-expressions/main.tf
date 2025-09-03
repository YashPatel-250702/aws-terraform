terraform {}


#How can we create variable list type

variable "num_list" {
  type = list(number)
  default = [ 0 , 1 , 2 , 3 , 4 , 5 ]
}

#How can we create list of objects
variable "object_list" {
  type = list(object({
    name = string
    age  = number
  }))
  default = [
    {
        name = "Yash Patel"
        age  = 23
    },{
        name = "Vineetha Maraganas"
        age  = 22
    }
  ]
}

#How can we create a map variable

variable "map_list" {
    type = map(number)
    default = {
      "one" = 1
      "two" = 2
      "three" = 3
    }
  
}

#Calculation 

locals {
  total = var.num_list[0] + var.num_list[1] + var.num_list[2] + var.num_list[3] + var.num_list[4] + var.num_list[5]
  
}

locals {
  mul = var.num_list[0] * var.num_list[1] * var.num_list[2] * var.num_list[3] * var.num_list[4] * var.num_list[5]
  
}

locals {
  sumAverage=local.total/length(var.num_list)
}

locals {
  mulAverage=local.mul/length(var.num_list)
}


locals {
  isaverageEqual = local.sumAverage != local.mulAverage
}


output "total" {
  value=local.total

}

output "average" {
  value=local.sumAverage
  
}
output "mulaverage" {
  value=local.mul
  
}
output "isaverageEqual" {
  value=local.isaverageEqual
  
}