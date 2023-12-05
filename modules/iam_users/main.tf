
# Create IAM users
resource "aws_iam_user" "users" {
  for_each = { for user in var.users : user.name => user }

  name = each.key
  tags = {
    Role     = each.value.role
    Products = join("-", each.value.products)
  }
}

# Create IAM groups 
resource "aws_iam_group" "groups" {
  for_each = { for group in var.groups : group => group }
  name     = each.key

}

# Associate IAM users with their respective groups
resource "aws_iam_user_group_membership" "user_group_membership" {
  for_each = { for user in var.users : user.name => user }

  user   = aws_iam_user.users[each.key].name
  groups = each.value.products

}

# Create IAM policies for for different groups.
resource "aws_iam_policy" "alpha" {
  name        = "AlphaPolicy"
  description = "IAM policy for Alpha group"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:GetObject"],
        Resource = ["arn:aws:s3:::alpha-bucket/*"],
      },
      # Add more policies as needed for Alpha group
    ],
  })
}

resource "aws_iam_policy" "beta" {
  name        = "BetaPolicy"
  description = "IAM policy for Beta group"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject"],
        Resource = ["arn:aws:s3:::beta-bucket/*"],
      },
      # Add more policies as needed for Beta group
    ],
  })
}

resource "aws_iam_policy" "gamma" {
  name        = "GammaPolicy"
  description = "IAM policy for Gamma group"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:ListBucket"],
        Resource = ["arn:aws:s3:::gamma-bucket"],
      },
      # Add more policies as needed for Gamma group
    ],
  })
}

# Attach IAM policies to IAM groups
## Use of toset to convert list to set, ensuring only unique values
resource "aws_iam_group_policy_attachment" "group_policy_attachments" {
  for_each = { for group in toset(var.groups) : group => group }
  group = each.value
  policy_arn = lookup({
    Alpha = aws_iam_policy.alpha.arn
    Beta  = aws_iam_policy.beta.arn
    Gamma = aws_iam_policy.gamma.arn
    # Add more IAM group-policy mappings as needed, following the syntax above
  }, each.value, null)
}