resource "aws_iam_role" "terraform_execution_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "terraform_execution_policy" {
  name        = var.iam_policy_name
  description = "Policy allowing Terraform execution access"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "s3:GetObject",
          "s3:PutObject",
          "dynamodb:UpdateItem"
        ]
        Resource = [
          "arn:aws:s3:::jobintel-terraform-state/*",
          "arn:aws:dynamodb:::table/jobintel-terraform-state-lock"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_policy_to_role" {
  role       = aws_iam_role.terraform_execution_role.name
  policy_arn = aws_iam_policy.terraform_execution_policy.arn
}