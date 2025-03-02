# Testing with Mock Providers in CAF Terraform Module

This document provides guidance on how to use mock providers for testing the Cloud Adoption Framework for Azure Terraform module.

## Introduction

Mock providers allow you to test your Terraform configurations without making actual API calls to Azure. This is useful for:
- Faster testing as no real resources are created
- Testing without Azure credentials
- Validating configuration syntax and logic
- CI/CD pipelines where real resource creation is not desired

## Mock Provider Structure

The CAF module uses Terraform's built-in testing framework with mock providers. The test files are located in the `examples/tests` directory:

- `examples/tests/general.tftest.hcl`: Basic test configuration with mock providers
- `examples/tests/mock/e2e_plan.tftest.hcl`: End-to-end plan test configuration
- `examples/tests/mock_data/data.tfmock.hcl`: Mock data definitions

## Creating Mock Data

Mock data is defined in `.tfmock.hcl` files. The CAF module includes a base mock data file at `examples/tests/mock_data/data.tfmock.hcl` that provides mock responses for common data sources:

```hcl
mock_data "azurerm_client_config" {
  defaults = {
    client_id       = "00000000-0000-0000-0000-000000000000"
    object_id       = "00000000-0000-0000-0000-000000000000"
    subscription_id = "00000000-0000-0000-0000-000000000000"
    tenant_id       = "00000000-0000-0000-0000-000000000000"
  }
}
```

You can extend this file or create new ones for specific test scenarios. The mock data should include all the necessary attributes that your Terraform configuration expects to receive from the provider.

## Configuring Mock Providers

Mock providers are configured in `.tftest.hcl` files. There are two approaches:

1. Basic configuration (no source specified):
```hcl
mock_provider "azurerm" {
}
```

2. Configuration with a source directory:
```hcl
mock_provider "azurerm" {
  source = "./tests/mock_data"
}
```

When a source is specified, Terraform will look for `.tfmock.hcl` files in that directory. This allows you to provide custom mock responses for data sources and resources.

For providers with aliases, you can specify the alias in the mock provider configuration:

```hcl
mock_provider "azurerm" {
  alias  = "vhub"
  source = "./tests/mock_data"
}
```

## Running Tests with Mock Providers

To run tests with mock providers, use the `terraform test` command from the examples directory:

```bash
terraform -chdir=./examples test \
-test-directory=./tests/mock \
-var-file=../examples/path/to/your/configuration.tfvars \
-verbose
```

This command:
1. Changes to the examples directory
2. Runs tests from the specified test directory
3. Uses the specified var file for configuration
4. Provides verbose output

The test command will execute the test cases defined in the `.tftest.hcl` files in the specified test directory. Each test case can include commands like `plan`, `apply`, and assertions to validate the expected behavior of your Terraform configuration.

## Testing Different Components

Each subfolder in the `/examples` directory represents a different test case. To test a specific component:

1. Identify the example configuration in the appropriate subfolder
2. Run the test command with the corresponding var file

For example, to test communication services:

```bash
terraform -chdir=./examples test \
-test-directory=./tests/mock \
-var-file=../examples/communication/communication_services/101-communication_service/configuration.tfvars \
-verbose
```

This will run the tests defined in the `.tftest.hcl` files in the `examples/tests/mock` directory using the configuration from the specified var file.

## Creating Custom Test Cases

You can create custom test cases by defining new `.tftest.hcl` files in the `examples/tests/mock` directory. A basic test case might look like:

```hcl
mock_provider "azurerm" {
  source = "./tests/mock_data"
}

mock_provider "azuread" {
  source = "./tests/mock_data"
}

run "test_plan" {
  command = plan
  
  assert {
    condition     = length(local.resource_groups) > 0
    error_message = "No resource groups defined"
  }
}
```

This test case will run a plan and assert that there is at least one resource group defined in the configuration.

## Best Practices

1. Always use mock providers for testing instead of connecting to Azure
2. Create specific mock data for your test scenarios
3. Test all examples before submitting changes
4. Organize tests by component in the examples directory
5. Use the verbose flag to get detailed output
6. Include assertions in your test cases to validate expected behavior
7. Test both successful and error scenarios
8. Keep mock data up-to-date with the latest provider schema

## Troubleshooting

If you encounter issues when running tests with mock providers, consider the following:

1. Ensure that the mock data includes all the necessary attributes for your configuration
2. Check that the path to the mock data directory is correct
3. Verify that the var file path is correct
4. Use the verbose flag to get more detailed output
5. Check for syntax errors in your `.tftest.hcl` and `.tfmock.hcl` files

## Conclusion

Using mock providers for testing is an essential practice for developing and maintaining Terraform configurations. It allows you to validate your configurations without creating real resources, making the testing process faster, safer, and more reliable.

By following the guidelines in this document, you can effectively test your Terraform configurations using mock providers in the CAF module.
