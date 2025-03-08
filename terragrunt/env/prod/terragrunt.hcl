include {
  path = find_in_parent_folders()
}

inputs = {
  environment    = "prod"
  home_public_ip = "203.0.113.2"  # Replace with your actual prod public IP
}
