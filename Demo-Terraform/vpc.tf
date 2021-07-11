# Custum VPC, with only one Pub Sebnet
resource "aws_vpc" "myVPC" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    enable_classiclink = "false"
    tags = {
        Name = "myVPC"
    }
}


# Subnets
resource "aws_subnet" "my-public-sub-1" {
    vpc_id = aws_vpc.myVPC.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "${var.AWS_REGION}a"

    tags = { Name = "my-public-sub-1" }
}

# Internet GW
resource "aws_internet_gateway" "my-ig" {
    vpc_id = aws_vpc.myVPC.id

    tags = {
        Name = "my-ig"
    }
}

# route tables
resource "aws_route_table" "my-public-rt" {
    vpc_id = aws_vpc.myVPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-ig.id
    }

    tags = {
        Name = "my-public-rt"
    }
}

# route associations public
resource "aws_route_table_association" "my-public-sub-1-a" {
    subnet_id = aws_subnet.my-public-sub-1.id
    route_table_id = aws_route_table.my-public-rt.id
	}