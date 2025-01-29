global_settings = {
  default_region = "region1"
  regions = {
    region1 = "westeurope"
  }
  environment = "mock"
  random_length = 5
  prefix       = "mock"
}

resource_groups = {
  mock_rg = {
    name     = "mock-rg"
    location = "westeurope"
  }
}

client_config = {
  landingzone_key = "mock"
}
