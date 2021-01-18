locals {
  az_names = data.aws_availability_zones.available.names
}

resource "aws_subnet" "public_subnet" {
  count                   = length(local.az_names)
  vpc_id                  = data.aws_vpc.default_vpc.id
  cidr_block              = "172.31.${1 + count.index}.0/24"
  availability_zone       = local.az_names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "${local.az_names[count.index]}-public-subnet"
  }
}
