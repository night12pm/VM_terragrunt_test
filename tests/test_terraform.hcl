terraform {
  required_version = ">= 1.4.0"
}

check "validate" {
  description = "Run terraform validate"
  command     = ["terraform", "validate"]
}

check "plan" {
  description = "Run terraform plan"
  command     = ["terraform", "plan"]
}

check "destroy" {
  description = "Ensure terraform destroy works without issues"
  command     = ["terraform", "destroy", "-auto-approve"]
}
