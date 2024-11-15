locals{
    project_name= "${var.project}-${var.environment}"
    availabilityzone=slice(data.aws_availability_zones.AZ.names,0,2)
} 