data "aws_iam_role" "existing_terraform_role" {
    name = var.iam_role_name
}