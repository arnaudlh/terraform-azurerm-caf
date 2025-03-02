# Terraform Test Framework for CAF Module

This directory contains the comprehensive test framework for the Cloud Adoption Framework for Azure Terraform module. The test framework is designed to validate the functionality of the module without requiring actual Azure resources or credentials.

## Test Structure

The tests are organized into the following categories:

- **Component Tests**: Tests for individual components (compute, networking, security, etc.)
- **Integration Tests**: Tests for integration between different components
- **Validation Tests**: Tests for input/output validation

```
tests/
├── mock/                       # Main test directory
│   ├── component_tests/        # Tests for individual components
│   │   ├── compute_tests.tftest.hcl
│   │   ├── networking_tests.tftest.hcl
│   │   ├── azuread_tests.tftest.hcl
│   │   ├── data_platform_tests.tftest.hcl
│   │   └── security_tests.tftest.hcl
│   ├── integration_tests/      # Tests for component integration
│   │   ├── compute_networking_integration.tftest.hcl
│   │   └── data_security_integration.tftest.hcl
│   └── validation_tests/       # Tests for input/output validation
│       ├── variable_validation.tftest.hcl
│       └── output_validation.tftest.hcl
├── mock_data/                  # Mock data for Azure resources
│   ├── compute_mock_data.tfmock.hcl
│   ├── networking_mock_data.tfmock.hcl
│   ├── azuread_mock_data.tfmock.hcl
│   ├── data_platform_mock_data.tfmock.hcl
│   └── security_mock_data.tfmock.hcl
└── helpers/                    # Test helper utilities
    ├── test_helpers.tf         # Common test configurations
    └── test_runner.sh          # Test execution script
```

## Mock Data

The tests use mock data to simulate Azure resources without requiring real Azure connections. The mock data is defined in the `mock_data` directory and organized by resource type:

- `compute_mock_data.tfmock.hcl`: Mock data for compute resources (VMs, AKS, etc.)
- `networking_mock_data.tfmock.hcl`: Mock data for networking resources (VNets, NSGs, etc.)
- `azuread_mock_data.tfmock.hcl`: Mock data for Azure AD resources
- `data_platform_mock_data.tfmock.hcl`: Mock data for data platform resources (Storage, SQL, etc.)
- `security_mock_data.tfmock.hcl`: Mock data for security resources (Key Vault, etc.)

## Running Tests

### Using the Test Runner Script

The test runner script provides a convenient way to run tests:

```bash
# Make the script executable
chmod +x ./examples/tests/helpers/test_runner.sh

# Run all tests
./examples/tests/helpers/test_runner.sh --type all

# Run component tests
./examples/tests/helpers/test_runner.sh --type component

# Run integration tests
./examples/tests/helpers/test_runner.sh --type integration

# Run validation tests
./examples/tests/helpers/test_runner.sh --type validation

# Run specific test file
./examples/tests/helpers/test_runner.sh --filter compute_tests.tftest.hcl

# Run tests with verbose output
./examples/tests/helpers/test_runner.sh --verbose
```

### Using Terraform Commands Directly

You can also run tests directly using Terraform commands:

```bash
# Run all tests
terraform -chdir=./examples test -test-directory=./tests/mock -verbose

# Run component tests
terraform -chdir=./examples test -test-directory=./tests/mock/component_tests -verbose

# Run integration tests
terraform -chdir=./examples test -test-directory=./tests/mock/integration_tests -verbose

# Run validation tests
terraform -chdir=./examples test -test-directory=./tests/mock/validation_tests -verbose

# Run specific test file
terraform -chdir=./examples test -test-directory=./tests/mock/component_tests -filter=compute_tests.tftest.hcl -verbose
```

## Test Helpers

The test framework includes helper utilities to simplify test creation and reduce duplication:

- `test_helpers.tf`: Contains common test configurations as local variables
- `test_runner.sh`: Script for running tests with various options

## Adding New Tests

### Component Tests

1. Identify the component to test
2. Create a new test file in the `component_tests` directory
3. Define the test variables and assertions
4. Add any necessary mock data to the appropriate mock data file

Example:

```hcl
mock_provider "azurerm" {
  source = "../../mock_data"
}

run "test_component_creation" {
  command = plan
  
  variables {
    global_settings = {
      default_region = "region1"
      regions = {
        region1 = "eastus"
      }
    }
    
    # Component-specific variables
    
  }
  
  assert {
    condition     = length(module.example.component) > 0
    error_message = "Component was not created"
  }
}
```

### Integration Tests

1. Identify the components to integrate
2. Create a new test file in the `integration_tests` directory
3. Define the test variables for both components
4. Add assertions that validate the integration

### Validation Tests

1. Identify the validation scenario (input validation, output structure, etc.)
2. Create a new test file in the `validation_tests` directory
3. Define test cases that validate the scenario
4. For input validation, use `expect_failures` to test error handling

## Best Practices

- **Keep tests focused**: Each test should focus on a specific functionality
- **Use descriptive test names**: Test names should clearly indicate what is being tested
- **Reuse mock data**: Use the existing mock data where possible
- **Ensure tests are isolated**: Tests should not depend on real Azure resources
- **Use assertions effectively**: Assertions should validate the expected behavior
- **Test error handling**: Include tests for error conditions
- **Keep tests maintainable**: Use the test helpers to reduce duplication

## Troubleshooting

### Common Issues

- **Mock data not found**: Ensure the mock data path is correct in the `mock_provider` block
- **Test failures**: Check the error message and update the test or module as needed
- **Terraform version compatibility**: Ensure you're using Terraform 1.5 or later for test support

### Debugging Tips

- Use the `-verbose` flag to get detailed output
- Check the mock data for the resource being tested
- Verify that the test variables match the expected module inputs
- Use `terraform fmt` to format test files

## Contributing

When contributing new tests:

1. Follow the existing test structure
2. Add appropriate mock data for new resource types
3. Update this README if necessary
4. Run the tests locally before submitting changes

## References

- [Terraform Test Documentation](https://developer.hashicorp.com/terraform/language/tests)
- [Terraform Mock Provider Documentation](https://developer.hashicorp.com/terraform/language/tests/mock)
- [CAF Module Documentation](https://github.com/aztfmod/terraform-azurerm-caf)
