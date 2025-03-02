# Cloud Adoption Framework for Azure - Terraform Module Examples

This directory contains examples demonstrating how to use the Cloud Adoption Framework (CAF) Terraform module for Azure. These examples cover a wide range of Azure services and deployment patterns, from simple standalone deployments to complex multi-service architectures.

## Examples Organization

The examples are organized by Azure service category:

| Category | Description | Directory |
|----------|-------------|-----------|
| Compute | Virtual Machines, AKS, Container Instances, etc. | [compute/](./compute/) |
| Networking | Virtual Networks, Load Balancers, Application Gateways, etc. | [networking/](./networking/) |
| Storage | Storage Accounts, Data Lake, etc. | [storage_accounts/](./storage_accounts/) |
| Databases | SQL, MySQL, PostgreSQL, Cosmos DB, etc. | [mssql_server/](./mssql_server/), [mysql_server/](./mysql_server/), etc. |
| Identity | Azure AD, Managed Identities, etc. | [azuread/](./azuread/), [managed_service_identity/](./managed_service_identity/) |
| Security | Key Vault, etc. | [keyvault/](./keyvault/) |
| Analytics | Synapse, Data Factory, etc. | [synapse_analytics/](./synapse_analytics/), [data_factory/](./data_factory/) |

Each category directory contains multiple examples demonstrating different aspects of the service.

## Getting Started with Examples

### Minimal Example

For a quick start, you can use the [standalone example](./standalone.md) which provides a minimal configuration:

```hcl
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.7.0"

  providers = {
    azurerm.vhub = azurerm.vhub
  }
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  
  # Add the resource blocks you need
  compute = {
    virtual_machines = var.virtual_machines
  }
  
  networking = {
    vnets = var.vnets
    public_ip_addresses = var.public_ip_addresses
  }
}
```

### Deploying Examples with Terraform

You can deploy any example using standard Terraform commands:

```bash
cd /tf/caf/examples/<path-to-example>
az login
terraform init
terraform plan -var-file configuration.tfvars
terraform apply -var-file configuration.tfvars
terraform destroy -var-file configuration.tfvars
```

### Deploying Examples with Rover

If you're using the CAF landing zones approach with rover, follow these steps:

1. Log in to your Azure subscription:
   ```bash
   rover login
   # Or specify tenant and subscription:
   rover login --tenant <tenant_name>.onmicrosoft.com -s <subscription_id>
   ```

2. Deploy the basic launchpad (if not already deployed):
   ```bash
   rover -lz /tf/caf/landingzones/caf_launchpad \
   -launchpad \
   -var-folder /tf/caf/landingzones/caf_launchpad/scenario/100 \
   -a apply
   ```

3. Deploy your example:
   ```bash
   rover -lz /tf/caf/landingzones/caf_example \
   -var-folder /tf/caf/examples/<path-of-the-example> \
   -a plan|apply
   ```

## Testing Examples

All examples in this directory are designed to be tested using mock providers instead of real Azure connections. Each subfolder represents a different test case that needs to be validated.

When making changes to the module or adding new examples, ensure that you test them locally using mock providers before submitting changes.

## Example Structure

Each example typically includes:

1. A README.md file explaining the purpose and usage of the example
2. A configuration.tfvars file with the variable values
3. Additional .tf files as needed for the specific example

## Contributing New Examples

When contributing new examples, please follow these guidelines:

1. Create a new directory under the appropriate category
2. Include a comprehensive README.md explaining the example
3. Ensure the example works with both rover and native Terraform
4. Test the example using mock providers before submitting
5. Follow the coding conventions as described in the [conventions documentation](../documentation/conventions.md)
