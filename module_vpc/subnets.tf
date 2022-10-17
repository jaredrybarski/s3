# Ice cream I SCREAM XDDDDDDD
resource "aws_subnet" "this" { # this -> private / priv
  for_each = local.subnets_priv

  vpc_id = aws_vpc.this.id

  availability_zone = each.key
  cidr_block        = each.value

  tags = {
    Name = "Private_subnet"
  }
}

resource "aws_subnet" "thhiis" { # thhiis -> public / pub
  for_each = local.subnets_pub

  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  availability_zone       = each.key
  cidr_block              = each.value


  tags = {
    Name = "Public_subnet"
  }
}
