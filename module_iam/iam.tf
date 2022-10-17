resource "aws_iam_role" "RoleForEC2"{
name = "RoleForEc2"
assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
       
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_policy" "policy" {
    name        = "code-deploy-ec2-permissions"
    path        = "/"
    description = "Policy for EC2 instances where Code Deploy would deploy the code"
    policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::nibr-useast1-as-search-code-deploy-dev/*"
      ]
    }
  ]
}
POLICY
}
resource "aws_iam_instance_profile" "RoleForEc2"{
name = "RoleForEc2"
role = aws_iam_role.RoleForEC2.name

}

resource "aws_iam_role_policy_attachment" "role_policy_attachment" {


role = "${aws_iam_role.RoleForEC2.name}"
policy_arn = "${aws_iam_policy.policy.arn}"

}