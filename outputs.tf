output "vpc_id" {
  value = aws_vpc.main.id
}

output "availabilityzone" {
  value = data.aws_availability_zones.AZ
}

output "defaultvpc" {
  value = data.aws_vpc.default
}

output "default_main_rt" {
  value=data.aws_route_table.default_vpc_rt  
}

output "public_subnet_ids"{
  value= aws_subnet.public[*].id
}
output "private_subnet_ids"{
  value= aws_subnet.private[*].id
}
output "database_subnet_ids"{
  value= aws_subnet.database[*].id
}
output "database_subent_grp_name"{
  value= aws_db_subnet_group.db_subnet_grp.name
}