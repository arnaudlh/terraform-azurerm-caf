# Azure [Resource Type]

This module is part of Cloud Adoption Framework landing zones for Azure on Terraform.

For an overview of the service, please refer to [Azure documentation](https://azure.microsoft.com/en-us/services/[service-name]/)

## Example scenarios

The following examples are available:

| Scenario | Description |
|----------|-------------|
| [Example 1](/examples/[resource_type]/[example_folder]) | Description of example 1 |
| [Example 2](/examples/[resource_type]/[example_folder]) | Description of example 2 |

You can instantiate this directly using the following parameters:

```hcl
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.7.0"

  # Add the required parameters here
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  
  # Add the resource block
  [resource_type] = var.[resource_type]
}
```

## Reference parameters

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| base_tags | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| client_config | Client configuration object (see module README.md). | `any` | n/a | yes |
| global_settings | Global settings object (see module README.md) | `any` | n/a | yes |
| location | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| resource_group_name | (Required) The name of the resource group where to create the resource. | `string` | n/a | yes |
| settings | Configuration object for the resource. Refer to documentation for details. | `any` | n/a | yes |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

### Settings details

The settings object is a map of maps containing the following attributes:

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Specify the name of the resource. Changing this forces a new resource to be created. | String | n/a | Yes |
| resource_group_key | Specify the key of the resource group where to deploy the resource. Changing this forces a new resource to be created. | String | n/a | Yes |
| region | Specify the region of the resource. Changing this forces a new resource to be created. | String | n/a | Yes |
| [additional_settings] | [Description of additional settings] | [Type] | [Default] | [Required] |

## Run this example

You can run this example directly using Terraform or via rover:

### With Terraform

```bash
# Login to your Azure subscription
az login

# Run the example
cd /tf/caf/examples

terraform init

terraform [plan | apply | destroy] \
  -var-file ../modules/[resource_type]/examples/[example_folder]/configuration.tfvars
```

### With rover

To test this deployment in the example landingzone, make sure the launchpad has been deployed first, then run the following command:

```bash
rover \
  -lz /tf/caf/examples \
  -var-folder ../modules/[resource_type]/examples/[example_folder] \
  -level level1 \
  -a [plan | apply | destroy]
```
