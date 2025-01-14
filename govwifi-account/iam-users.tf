resource "aws_iam_user" "govwifi-pipeline-deploy-prod" {
  name          = "govwifi-pipeline-deploy-prod"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "govwifi-pipeline-deploy-admin" {
  name          = "govwifi-pipeline-deploy-admin"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "govwifi-pipeline-deploy-staging" {
  name          = "govwifi-pipeline-deploy-staging"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "govwifi-pipeline-deploy-smoketest" {
  name          = "govwifi-pipeline-deploy-smoketest"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "govwifi-pipeline-terraform" {
  name          = "govwifi-pipeline-terraform"
  path          = "/"
  force_destroy = false
}

# Groups for the users

resource "aws_iam_user_group_membership" "govwifi-pipeline-terraform" {
  user = "govwifi-pipeline-terraform"

  groups = [
    "AWS-Admin",
  ]
}

resource "aws_iam_user_group_membership" "govwifi-pipeline-deploy-prod" {
  user = "govwifi-pipeline-deploy-prod"

  groups = [
    "GovWifi-Pipeline",
  ]
}

resource "aws_iam_user_group_membership" "govwifi-pipeline-deploy-staging" {
  user = "govwifi-pipeline-deploy-staging"

  groups = [
    "GovWifi-Pipeline",
  ]
}

resource "aws_iam_user_group_membership" "govwifi-pipeline-deploy-smoketest" {
  user = "govwifi-pipeline-deploy-smoketest"

  groups = [
    "GovWifi-Pipeline",
  ]
}

resource "aws_iam_user_group_membership" "govwifi-pipeline-deploy-admin" {
  user = "govwifi-pipeline-deploy-admin"

  groups = [
    "GovWifi-Pipeline",
  ]
}

resource "aws_iam_user" "monitoring-stats-user" {
  name          = "monitoring-stats-user"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "mysql-s3-bucket-push-user" {
  name          = "mysql-s3-bucket-push-user"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_user" "it-govwifi-backup-reader" {
  name          = "it-govwifi-backup-reader"
  path          = "/"
  force_destroy = false
}
