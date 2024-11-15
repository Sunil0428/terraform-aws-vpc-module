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