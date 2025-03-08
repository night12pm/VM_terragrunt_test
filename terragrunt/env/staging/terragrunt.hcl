include {
  path = find_in_parent_folders()
}

inputs = {
  environment    = "staging"
  home_public_ip = "203.0.113.1"  # Replace with your actual staging public IP
}
