resource "aws_iam_policy" "security_policy_name" {
  name        = var.security_policy_name
  description = "Security policy for IAM access control"
  policy      = file("iam_policy.json")
}
