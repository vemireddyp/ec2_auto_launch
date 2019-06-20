/*data "aws_kms_key" "ssm-key" {
key_id = "alias/ssm"
}

resource "aws_ssm_parameter" "domain_username" {
  name        = "domain_username"
  description = "Domain username"
  type        = "String"
  value       = "${var.domain_username}"
  overwrite   = true
}

resource "aws_ssm_parameter" "domain_password" {
  name        = "domain_password"
  description = "Domain password"
  type        = "SecureString"
  value       = "${var.domain_password}"
  key_id      = "${data.aws_kms_key.ssm-key.arn}"
  overwrite   = true
}

resource "aws_ssm_parameter" "ipdns" {
  name        = "ipdns"
  description = "DNS IP Address"
  type        = "String"
  value       = "${join(",", var.domain_dns_ips)}"
  overwrite   = true
}

resource "aws_ssm_parameter" "domain_name" {
  name        = "domain_name"
  description = "Domain name"
  type        = "String"
  value       = "${var.domain_name}"
  overwrite   = true
}

resource "aws_ssm_parameter" "domain_ou_path" {
  name        = "domain_ou_path"
  description = "Domain OU path"
  type        = "String"
  value       = "${var.domain_ou_path}"
  overwrite   = true
}*/
