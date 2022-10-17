output "subnet_priv_ids" {
  value = { for k, v in aws_subnet.this : k => v.id }
}

output "subnet_pub_ids" {
  value = { for k, v in aws_subnet.thhiis : k => v.id }  # huuuuh? I bet a typo came in :D
}

output "subnets_priv" {
  value = aws_subnet.this
}

output "subnets_pub" {
  value = values(aws_subnet.thhiis)[*].id  # rule of thumb: disconnect yourself from the code you write and treat it as written by random person and ask youself how much sense does this make
  # I try to do this as much as I can, it helps a lot, cause I'm not the sharpest tool in a shed
  # She was looking kind of dumb
  # with her finger and her thumb
  # In the shape of an "L"
  # on her forehead
}

