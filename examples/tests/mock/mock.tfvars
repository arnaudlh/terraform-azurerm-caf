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
  client_id               = "00000000-0000-0000-0000-000000000000"
  tenant_id               = "00000000-0000-0000-0000-000000000000"
  subscription_id         = "00000000-0000-0000-0000-000000000001"
  landingzone_key        = "mock"
}
