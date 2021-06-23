# Azure Cosmos DB

This submodule is part of Cloud Adoption Framework landing zones for Azure on Terraform.

You can instantiate this submodule directly using the following parameters:

```
module "caf_cosmos_db" {
  source  = "aztfmod/caf/azurerm//modules/databases/cosmos_db"
  version = "4.21.2"
  # insert the 5 required variables here
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | n/a |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cassandra_keyspaces"></a> [cassandra\_keyspaces](#module\_cassandra\_keyspaces) | ./cassandra_keyspace | n/a |
| <a name="module_gremlin_databases"></a> [gremlin\_databases](#module\_gremlin\_databases) | ./gremlin_database | n/a |
| <a name="module_mongo_databases"></a> [mongo\_databases](#module\_mongo\_databases) | ./mongo_database | n/a |
| <a name="module_sql_databases"></a> [sql\_databases](#module\_sql\_databases) | ./sql_database | n/a |
| <a name="module_tables"></a> [tables](#module\_tables) | ./table | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.cdb](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_cosmosdb_account.cosmos_account](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_tags"></a> [base\_tags](#input\_base\_tags) | Base tags for the resource to be inherited from the resource group. | `map(any)` | n/a | yes |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object (see module README.md) | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where to create the resource. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) The name of the resource group where to create the resource. | `string` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cassandra_keyspaces"></a> [cassandra\_keyspaces](#output\_cassandra\_keyspaces) | n/a |
| <a name="output_connection_string"></a> [connection\_string](#output\_connection\_string) | n/a |
| <a name="output_cosmos_account"></a> [cosmos\_account](#output\_cosmos\_account) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_gremlin_databases"></a> [gremlin\_databases](#output\_gremlin\_databases) | n/a |
| <a name="output_mongo_databases"></a> [mongo\_databases](#output\_mongo\_databases) | n/a |
| <a name="output_primary_key"></a> [primary\_key](#output\_primary\_key) | n/a |
| <a name="output_sql_databases"></a> [sql\_databases](#output\_sql\_databases) | n/a |
| <a name="output_tables"></a> [tables](#output\_tables) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->