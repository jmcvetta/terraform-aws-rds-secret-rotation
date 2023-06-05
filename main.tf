locals {
  rotation               = var.rotation_days == null ? false : true
  function_name          = var.function_name
  default_lambda_handler = "lambda_function.lambda_handler"
  lambda_runtime         = "python3.8"
  name                   = "${var.name_prefix}-${var.username}-rotate-secret"

  secret_value_single_user = {
    username            = var.username
    password            = var.password
    engine              = var.engine
    host                = var.host
    port                = var.port
    dbClusterIdentifier = var.db_cluster_identifier
  }
  secret_value_multiuser = {
    username            = var.username
    password            = var.password
    engine              = var.engine
    host                = var.host
    port                = var.port
    masterarn           = var.master_secret_arn
    dbClusterIdentifier = var.db_cluster_identifier
  }

  default_lambda_env_vars = {
    SECRETS_MANAGER_ENDPOINT = "https://secretsmanager.${data.aws_region.current.name}.amazonaws.com"
  }
}

data "aws_region" "current" {}
