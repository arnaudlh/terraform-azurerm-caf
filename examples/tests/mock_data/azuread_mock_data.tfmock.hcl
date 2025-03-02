mock_data "azuread_application" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000002"
    object_id                = "00000000-0000-0000-0000-000000000002"
    display_name             = "mock-application"
    app_role_ids             = {}
    app_roles                = []
    available_to_other_tenants = false
    group_membership_claims  = "None"
    identifier_uris          = []
    oauth2_allow_implicit_flow = false
    oauth2_permissions       = []
    reply_urls               = []
    required_resource_access = []
  }
}

mock_data "azuread_service_principal" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000003"
    object_id                = "00000000-0000-0000-0000-000000000003"
    application_id           = "00000000-0000-0000-0000-000000000002"
    display_name             = "mock-service-principal"
    app_role_assignment_required = false
  }
}

mock_data "azuread_group" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000004"
    object_id                = "00000000-0000-0000-0000-000000000004"
    display_name             = "mock-group"
    description              = "Mock Azure AD Group"
    mail_enabled             = false
    security_enabled         = true
    members                  = []
  }
}

mock_data "azuread_user" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000005"
    object_id                = "00000000-0000-0000-0000-000000000005"
    user_principal_name      = "mock.user@example.com"
    display_name             = "Mock User"
    mail                     = "mock.user@example.com"
    mail_nickname            = "mockuser"
    account_enabled          = true
    password                 = "Password123!"
  }
}

mock_data "azuread_administrative_unit" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000006"
    object_id                = "00000000-0000-0000-0000-000000000006"
    display_name             = "mock-admin-unit"
    description              = "Mock Administrative Unit"
    members                  = []
  }
}

mock_data "azuread_application_password" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000007"
    application_object_id    = "00000000-0000-0000-0000-000000000002"
    display_name             = "mock-app-password"
    value                    = "mock-password-value"
    start_date               = "2023-01-01T00:00:00Z"
    end_date                 = "2099-01-01T00:00:00Z"
  }
}

mock_data "azuread_service_principal_password" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000008"
    service_principal_id     = "00000000-0000-0000-0000-000000000003"
    display_name             = "mock-sp-password"
    value                    = "mock-password-value"
    start_date               = "2023-01-01T00:00:00Z"
    end_date                 = "2099-01-01T00:00:00Z"
  }
}

mock_data "azuread_application_app_role" {
  defaults = {
    id                       = "00000000-0000-0000-0000-000000000009"
    application_object_id    = "00000000-0000-0000-0000-000000000002"
    allowed_member_types     = ["User", "Application"]
    description              = "Mock App Role"
    display_name             = "mock-app-role"
    is_enabled               = true
    value                    = "mock.role"
  }
}

mock_data "azuread_directory_role" {
  defaults = {
    id                       = "00000000-0000-0000-0000-00000000000a"
    object_id                = "00000000-0000-0000-0000-00000000000a"
    display_name             = "Global Administrator"
    description              = "Can manage all aspects of Azure AD and Microsoft services that use Azure AD identities."
    template_id              = "62e90394-69f5-4237-9190-012177145e10"
  }
}

mock_data "azuread_directory_role_assignment" {
  defaults = {
    id                       = "00000000-0000-0000-0000-00000000000b"
    role_id                  = "00000000-0000-0000-0000-00000000000a"
    principal_object_id      = "00000000-0000-0000-0000-000000000005"
  }
}

mock_data "azuread_application_pre_authorized" {
  defaults = {
    id                       = "00000000-0000-0000-0000-00000000000c"
    application_object_id    = "00000000-0000-0000-0000-000000000002"
    authorized_app_id        = "00000000-0000-0000-0000-00000000000d"
    permission_ids           = ["00000000-0000-0000-0000-00000000000e"]
  }
}

mock_data "azuread_service_principal_token_signing_certificate" {
  defaults = {
    id                       = "00000000-0000-0000-0000-00000000000f"
    service_principal_id     = "00000000-0000-0000-0000-000000000003"
    display_name             = "mock-token-signing-cert"
    end_date                 = "2099-01-01T00:00:00Z"
    key_id                   = "00000000-0000-0000-0000-000000000010"
    value                    = "mock-certificate-value"
  }
}
