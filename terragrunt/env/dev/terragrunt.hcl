include {
  path = find_in_parent_folders()
}

inputs = {
  environment    = "dev"
  home_public_ip = "203.0.113.0"  # Replace with your actual dev public IP
}
