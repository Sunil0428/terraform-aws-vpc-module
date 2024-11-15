# this block is for establishing peering connection to the default vpc from the vpc we created in this module
resource "aws_vpc_peering_connection" "peering" {
  count= var.Is_Peering_req == true ? 1 : 0  
  vpc_id      = aws_vpc.main.id
  peer_vpc_id = data.aws_vpc.default.id
  auto_accept = true
  tags=merge(
    var.common_tags,
    var.peering_tags,
    {
        Name="${local.project_name}-default"
    }
  )
}

#associating public and private route tables of the created vpc to the default vpc to establish routes

resource "aws_route" "public_peering" {
  count= var.Is_Peering_req == true ? 1 : 0  
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.peering[count.index].id
}

resource "aws_route" "private_peering" {
  count= var.Is_Peering_req == true ? 1 : 0  
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.peering[count.index].id
}

#associating main route table of the default vpc to the created vpc in our module 

resource "aws_route" "default_peering" {
  count= var.Is_Peering_req == true ? 1 : 0  
  route_table_id            = data.aws_route_table.default_vpc_rt.route_table_id
  destination_cidr_block    = var.cidr_block
  vpc_peering_connection_id= aws_vpc_peering_connection.peering[count.index].id
}

