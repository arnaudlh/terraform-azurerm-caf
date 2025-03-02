# [Example Name]

This example demonstrates how to [brief description of what the example does].

## Prerequisites

- [List any prerequisites for running the example]
- Access to an Azure subscription
- Terraform installed
- [Any other requirements]

## Example Architecture

[Optional: Include a brief description or diagram of the architecture created by this example]

## Usage

### With Terraform

```bash
# Login to your Azure subscription
az login

# Initialize Terraform
terraform init

# Plan the deployment
terraform plan -var-file configuration.tfvars

# Apply the deployment
terraform apply -var-file configuration.tfvars

# Destroy the deployment when done
terraform destroy -var-file configuration.tfvars
```

### With Rover

```bash
# Login to your Azure subscription
rover login

# Deploy the example
rover -lz /tf/caf/landingzones/caf_example \
  -var-folder /tf/caf/examples/[path-to-example] \
  -level level1 \
  -a [plan|apply|destroy]
```

## Expected Resources

This example will create the following resources:

- [List of resources created by the example]
- Resource Group: [name]
- [Other resources]

## Testing

This example can be tested using mock providers instead of real Azure connections. Each subfolder in the examples directory represents a different test case that needs to be validated.

## Notes

[Any additional notes or considerations for this example]
