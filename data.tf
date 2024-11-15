data "aws_availability_zones" "AZ" {
    state = "available"
}
# data source for fetching default vpc
data "aws_vpc" "default" {                                                                                                                            
  default = true                                                                                                                                      
} 
#data source for fetching route table in default vpc
data "aws_route_table" "default_vpc_rt" {
  vpc_id = data.aws_vpc.default.id  # Replace with your VPC ID
}