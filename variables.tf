variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  default = "true"
}

variable "project" {
  type = string
}
variable "environment" {
  type = string
}
variable "common_tags" {
  type = map(string)
}
variable "vpc_tags" {
  type = map(string)
}
variable "igw_tags" {
  type = map(string)
}
variable "public_cidr" {
  type = list(string)
  validation {
    condition     = length(var.public_cidr) == 2
    error_message = "two cidr values must be provided for subnet"
  }
}
variable "public_subnet_tags"{
    type=map(string)
}
variable "private_cidr" {
  type = list(string)
  validation {
    condition     = length(var.private_cidr) == 2
    error_message = "two cidr values must be provided for subnet"
  }
}
variable "private_subnet_tags"{
    type=map(string)
}
variable "database_cidr" {
  type = list(string)
  validation {
    condition     = length(var.database_cidr) == 2
    error_message = "two cidr values must be provided for subnet"
  }
}
variable "database_subnet_tags"{
    type=map(string)
}
variable "db_subnet_grp_tags" {
  type=map(string)
}
variable "ng_tags" {
  type=map(string)
}
variable "eip_tags" {
  type=map(string)
}
variable "public_rt_tags"{
  type=map(string)
}
variable "private_rt_tags"{
  type=map(string)
}
variable "database_rt_tags"{
  type=map(string)
}
variable "Is_Peering_req" {
  type= bool
   
}
variable "peering_tags"{
  type=map(string)
  default={}
}