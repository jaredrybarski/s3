resource "aws_instance" "machine_priv" {
  for_each = var.machine_priv

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  iam_instance_profile = var.iam_profile
  
  subnet_id = each.value

user_data = <<EOF
#!/bin/bash
sudo su
yum update -y
yum install httpd -y
aws s3 cp s3://${var.bucket_public}/index.html  /var/www/html/index.html
systemctl start httpd
systemctl enable httpd

EOF
  tags = {
    # usually cloud-native tagging is done in lowercase (that is my default at least) unless specified otherwise
    Name = "vm"
  }
}

resource "aws_instance" "machine_pub" {
  for_each = var.machine_pub

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  iam_instance_profile = var.iam_profile
  subnet_id = each.value
  key_name  = "mainc"

user_data = <<EOF

#!/bin/bash
sudo su
yum update -y
yum install httpd -y
aws s3 cp s3://${var.bucket_public}/index.html  /var/www/html/index.html
systemctl start httpd
systemctl enable httpd

EOF
}

 



# the hell is module_ec2 — skrót.lnk????? - remove xDD
