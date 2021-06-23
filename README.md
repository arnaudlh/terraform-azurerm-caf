# Cloud Adoption Framework for Azure - Terraform module

Microsoft [Cloud Adoption Framework for Azure](https://aka.ms/caf) provides you with guidance and best practices to adopt Azure.

This module allows you to create resources on Microsoft Azure, is used by the Cloud Adoption Framework for Azure (CAF) landing zones to provision resources in an Azure subscription and can deploy resources being directly invoked from the Terraform registry.

## Prerequisites

- Setup your **environment** using the following guide [Getting Started](https://github.com/Azure/caf-terraform-landingzones/blob/master/documentation/getting_started/getting_started.md) or you use it online with [GitHub Codespaces](https://github.com/features/codespaces).
- Access to an **Azure subscription**.


## Getting started

This module can be used inside [Cloud Adoption Framework Landing zones](https://github.com/Azure/caf-terraform-landingzones), or can be used as standalone, directly from the [Terraform registry](https://registry.terraform.io/modules/aztfmod/caf/azurerm/)

```terraform
module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "~>5.1.0"
  # insert the 7 required variables here
}
```

Fill the variables as needed and documented, there is a [quick example here](./examples/standalone.md).

For a complete set of examples you can review the [full library here](./examples).

<img src="https://aztfmod.blob.core.windows.net/media/standalone.gif" width="720"/> <br/> <br/>


## Community

Feel free to open an issue for feature or bug, or to submit a PR, [please review the module contribution and conventions guidelines](./documentation/conventions.md)

In case you have any question, you can reach out to tf-landingzones at microsoft dot com.

You can also reach us on [Gitter](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

## Code of conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Detailed variables

Below is the really detailed view on the variables:

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 1.4.0 |
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | ~> 1.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.64.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | ~> 1.4.0 |
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | ~> 1.2.0 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.64.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks_clusters"></a> [aks\_clusters](#module\_aks\_clusters) | ./modules/compute/aks | n/a |
| <a name="module_app_config"></a> [app\_config](#module\_app\_config) | ./modules/databases/app_config | n/a |
| <a name="module_app_service_environments"></a> [app\_service\_environments](#module\_app\_service\_environments) | ./modules/webapps/ase | n/a |
| <a name="module_app_service_plans"></a> [app\_service\_plans](#module\_app\_service\_plans) | ./modules/webapps/asp | n/a |
| <a name="module_app_services"></a> [app\_services](#module\_app\_services) | ./modules/webapps/appservice | n/a |
| <a name="module_application_gateway_waf_policies"></a> [application\_gateway\_waf\_policies](#module\_application\_gateway\_waf\_policies) | ./modules/networking/application_gateway_waf_policies | n/a |
| <a name="module_application_gateways"></a> [application\_gateways](#module\_application\_gateways) | ./modules/networking/application_gateway | n/a |
| <a name="module_application_security_groups"></a> [application\_security\_groups](#module\_application\_security\_groups) | ./modules/networking/application_security_group | n/a |
| <a name="module_automations"></a> [automations](#module\_automations) | ./modules/automation | n/a |
| <a name="module_availability_sets"></a> [availability\_sets](#module\_availability\_sets) | ./modules/compute/availability_set | n/a |
| <a name="module_azuread_applications"></a> [azuread\_applications](#module\_azuread\_applications) | ./modules/azuread/applications | n/a |
| <a name="module_azuread_applications_v1"></a> [azuread\_applications\_v1](#module\_azuread\_applications\_v1) | ./modules/azuread/applications_v1 | n/a |
| <a name="module_azuread_credentials"></a> [azuread\_credentials](#module\_azuread\_credentials) | ./modules/azuread/credentials | n/a |
| <a name="module_azuread_groups"></a> [azuread\_groups](#module\_azuread\_groups) | ./modules/azuread/groups | n/a |
| <a name="module_azuread_groups_members"></a> [azuread\_groups\_members](#module\_azuread\_groups\_members) | ./modules/azuread/groups_members | n/a |
| <a name="module_azuread_roles_applications"></a> [azuread\_roles\_applications](#module\_azuread\_roles\_applications) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_roles_msi"></a> [azuread\_roles\_msi](#module\_azuread\_roles\_msi) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_roles_mssql_server"></a> [azuread\_roles\_mssql\_server](#module\_azuread\_roles\_mssql\_server) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_roles_service_principals"></a> [azuread\_roles\_service\_principals](#module\_azuread\_roles\_service\_principals) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_roles_sql_mi"></a> [azuread\_roles\_sql\_mi](#module\_azuread\_roles\_sql\_mi) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_roles_sql_mi_secondary"></a> [azuread\_roles\_sql\_mi\_secondary](#module\_azuread\_roles\_sql\_mi\_secondary) | ./modules/azuread/roles | n/a |
| <a name="module_azuread_service_principal_passwords"></a> [azuread\_service\_principal\_passwords](#module\_azuread\_service\_principal\_passwords) | ./modules/azuread/service_principal_password | n/a |
| <a name="module_azuread_service_principals"></a> [azuread\_service\_principals](#module\_azuread\_service\_principals) | ./modules/azuread/service_principal | n/a |
| <a name="module_azuread_users"></a> [azuread\_users](#module\_azuread\_users) | ./modules/azuread/users | n/a |
| <a name="module_azurerm_application_insights"></a> [azurerm\_application\_insights](#module\_azurerm\_application\_insights) | ./modules/app_insights | n/a |
| <a name="module_azurerm_firewall_application_rule_collections"></a> [azurerm\_firewall\_application\_rule\_collections](#module\_azurerm\_firewall\_application\_rule\_collections) | ./modules/networking/firewall_application_rule_collections | n/a |
| <a name="module_azurerm_firewall_nat_rule_collections"></a> [azurerm\_firewall\_nat\_rule\_collections](#module\_azurerm\_firewall\_nat\_rule\_collections) | ./modules/networking/firewall_nat_rule_collections | n/a |
| <a name="module_azurerm_firewall_network_rule_collections"></a> [azurerm\_firewall\_network\_rule\_collections](#module\_azurerm\_firewall\_network\_rule\_collections) | ./modules/networking/firewall_network_rule_collections | n/a |
| <a name="module_azurerm_firewall_policies"></a> [azurerm\_firewall\_policies](#module\_azurerm\_firewall\_policies) | ./modules/networking/firewall_policies | n/a |
| <a name="module_azurerm_firewall_policy_rule_collection_groups"></a> [azurerm\_firewall\_policy\_rule\_collection\_groups](#module\_azurerm\_firewall\_policy\_rule\_collection\_groups) | ./modules/networking/firewall_policy_rule_collection_groups | n/a |
| <a name="module_azurerm_firewalls"></a> [azurerm\_firewalls](#module\_azurerm\_firewalls) | ./modules/networking/firewall | n/a |
| <a name="module_azurerm_virtual_hub_route_table"></a> [azurerm\_virtual\_hub\_route\_table](#module\_azurerm\_virtual\_hub\_route\_table) | ./modules/networking/virtual_hub_route_tables | n/a |
| <a name="module_bastion_host_diagnostics"></a> [bastion\_host\_diagnostics](#module\_bastion\_host\_diagnostics) | ./modules/diagnostics | n/a |
| <a name="module_container_groups"></a> [container\_groups](#module\_container\_groups) | ./modules/compute/container_group | n/a |
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ./modules/compute/container_registry | n/a |
| <a name="module_cosmos_dbs"></a> [cosmos\_dbs](#module\_cosmos\_dbs) | ./modules/databases/cosmos_dbs | n/a |
| <a name="module_custom_roles"></a> [custom\_roles](#module\_custom\_roles) | ./modules/roles/custom_roles | n/a |
| <a name="module_data_factory"></a> [data\_factory](#module\_data\_factory) | ./modules/data_factory/data_factory | n/a |
| <a name="module_data_factory_dataset_azure_blob"></a> [data\_factory\_dataset\_azure\_blob](#module\_data\_factory\_dataset\_azure\_blob) | ./modules/data_factory/datasets/azure_blob | n/a |
| <a name="module_data_factory_dataset_cosmosdb_sqlapi"></a> [data\_factory\_dataset\_cosmosdb\_sqlapi](#module\_data\_factory\_dataset\_cosmosdb\_sqlapi) | ./modules/data_factory/datasets/cosmosdb_sqlapi | n/a |
| <a name="module_data_factory_dataset_delimited_text"></a> [data\_factory\_dataset\_delimited\_text](#module\_data\_factory\_dataset\_delimited\_text) | ./modules/data_factory/datasets/delimited_text | n/a |
| <a name="module_data_factory_dataset_http"></a> [data\_factory\_dataset\_http](#module\_data\_factory\_dataset\_http) | ./modules/data_factory/datasets/http | n/a |
| <a name="module_data_factory_dataset_json"></a> [data\_factory\_dataset\_json](#module\_data\_factory\_dataset\_json) | ./modules/data_factory/datasets/json | n/a |
| <a name="module_data_factory_dataset_mysql"></a> [data\_factory\_dataset\_mysql](#module\_data\_factory\_dataset\_mysql) | ./modules/data_factory/datasets/mysql | n/a |
| <a name="module_data_factory_dataset_postgresql"></a> [data\_factory\_dataset\_postgresql](#module\_data\_factory\_dataset\_postgresql) | ./modules/data_factory/datasets/postgresql | n/a |
| <a name="module_data_factory_dataset_sql_server_table"></a> [data\_factory\_dataset\_sql\_server\_table](#module\_data\_factory\_dataset\_sql\_server\_table) | ./modules/data_factory/datasets/sql_server_table | n/a |
| <a name="module_data_factory_linked_service_azure_blob_storage"></a> [data\_factory\_linked\_service\_azure\_blob\_storage](#module\_data\_factory\_linked\_service\_azure\_blob\_storage) | ./modules/data_factory/linked_services/azure_blob_storage | n/a |
| <a name="module_data_factory_pipeline"></a> [data\_factory\_pipeline](#module\_data\_factory\_pipeline) | ./modules/data_factory/data_factory_pipeline | n/a |
| <a name="module_data_factory_trigger_schedule"></a> [data\_factory\_trigger\_schedule](#module\_data\_factory\_trigger\_schedule) | ./modules/data_factory/data_factory_trigger_schedule | n/a |
| <a name="module_databricks_workspaces"></a> [databricks\_workspaces](#module\_databricks\_workspaces) | ./modules/analytics/databricks_workspace | n/a |
| <a name="module_dedicated_host_groups"></a> [dedicated\_host\_groups](#module\_dedicated\_host\_groups) | ./modules/compute/dedicated_host_groups | n/a |
| <a name="module_dedicated_hosts"></a> [dedicated\_hosts](#module\_dedicated\_hosts) | ./modules/compute/dedicated_hosts | n/a |
| <a name="module_diagnostic_event_hub_namespaces"></a> [diagnostic\_event\_hub\_namespaces](#module\_diagnostic\_event\_hub\_namespaces) | ./modules/event_hubs/namespaces | n/a |
| <a name="module_diagnostic_event_hub_namespaces_diagnostics"></a> [diagnostic\_event\_hub\_namespaces\_diagnostics](#module\_diagnostic\_event\_hub\_namespaces\_diagnostics) | ./modules/diagnostics | n/a |
| <a name="module_diagnostic_log_analytics"></a> [diagnostic\_log\_analytics](#module\_diagnostic\_log\_analytics) | ./modules/log_analytics | n/a |
| <a name="module_diagnostic_log_analytics_diagnostics"></a> [diagnostic\_log\_analytics\_diagnostics](#module\_diagnostic\_log\_analytics\_diagnostics) | ./modules/diagnostics | n/a |
| <a name="module_diagnostic_storage_accounts"></a> [diagnostic\_storage\_accounts](#module\_diagnostic\_storage\_accounts) | ./modules/storage_account | n/a |
| <a name="module_disk_encryption_sets"></a> [disk\_encryption\_sets](#module\_disk\_encryption\_sets) | ./modules/security/disk_encryption_set | n/a |
| <a name="module_dns_zone_records"></a> [dns\_zone\_records](#module\_dns\_zone\_records) | ./modules/networking/dns_zone/records | n/a |
| <a name="module_dns_zones"></a> [dns\_zones](#module\_dns\_zones) | ./modules/networking/dns_zone | n/a |
| <a name="module_domain_name_registrations"></a> [domain\_name\_registrations](#module\_domain\_name\_registrations) | ./modules/networking/domain_name_registrations | n/a |
| <a name="module_dynamic_keyvault_secrets"></a> [dynamic\_keyvault\_secrets](#module\_dynamic\_keyvault\_secrets) | ./modules/security/dynamic_keyvault_secrets | n/a |
| <a name="module_event_hub_auth_rules"></a> [event\_hub\_auth\_rules](#module\_event\_hub\_auth\_rules) | ./modules/event_hubs/hubs/auth_rules | n/a |
| <a name="module_event_hub_consumer_groups"></a> [event\_hub\_consumer\_groups](#module\_event\_hub\_consumer\_groups) | ./modules/event_hubs/consumer_groups | n/a |
| <a name="module_event_hub_namespace_auth_rules"></a> [event\_hub\_namespace\_auth\_rules](#module\_event\_hub\_namespace\_auth\_rules) | ./modules/event_hubs/namespaces/auth_rules | n/a |
| <a name="module_event_hub_namespaces"></a> [event\_hub\_namespaces](#module\_event\_hub\_namespaces) | ./modules/event_hubs/namespaces | n/a |
| <a name="module_event_hub_namespaces_diagnostics"></a> [event\_hub\_namespaces\_diagnostics](#module\_event\_hub\_namespaces\_diagnostics) | ./modules/diagnostics | n/a |
| <a name="module_event_hub_namespaces_private_endpoints"></a> [event\_hub\_namespaces\_private\_endpoints](#module\_event\_hub\_namespaces\_private\_endpoints) | ./modules/networking/private_endpoint | n/a |
| <a name="module_event_hubs"></a> [event\_hubs](#module\_event\_hubs) | ./modules/event_hubs/hubs | n/a |
| <a name="module_express_route_circuit_authorizations"></a> [express\_route\_circuit\_authorizations](#module\_express\_route\_circuit\_authorizations) | ./modules/networking/express_route_circuit_authorization | n/a |
| <a name="module_express_route_circuits"></a> [express\_route\_circuits](#module\_express\_route\_circuits) | ./modules/networking/express_route_circuit | n/a |
| <a name="module_front_door_waf_policies"></a> [front\_door\_waf\_policies](#module\_front\_door\_waf\_policies) | ./modules/networking/front_door_waf_policy | n/a |
| <a name="module_front_doors"></a> [front\_doors](#module\_front\_doors) | ./modules/networking/front_door | n/a |
| <a name="module_front_doors_keyvault_access_policy"></a> [front\_doors\_keyvault\_access\_policy](#module\_front\_doors\_keyvault\_access\_policy) | ./modules/security/keyvault_access_policies | n/a |
| <a name="module_function_apps"></a> [function\_apps](#module\_function\_apps) | ./modules/webapps/function_app | n/a |
| <a name="module_image_definitions"></a> [image\_definitions](#module\_image\_definitions) | ./modules/shared_image_gallery/image_definitions | n/a |
| <a name="module_integration_service_environment"></a> [integration\_service\_environment](#module\_integration\_service\_environment) | ./modules/logic_app/integration_service_environment | n/a |
| <a name="module_ip_groups"></a> [ip\_groups](#module\_ip\_groups) | ./modules/networking/ip_group | n/a |
| <a name="module_keyvault_access_policies"></a> [keyvault\_access\_policies](#module\_keyvault\_access\_policies) | ./modules/security/keyvault_access_policies | n/a |
| <a name="module_keyvault_access_policies_azuread_apps"></a> [keyvault\_access\_policies\_azuread\_apps](#module\_keyvault\_access\_policies\_azuread\_apps) | ./modules/security/keyvault_access_policies | n/a |
| <a name="module_keyvault_certificate_issuers"></a> [keyvault\_certificate\_issuers](#module\_keyvault\_certificate\_issuers) | ./modules/security/keyvault_certificate_issuer | n/a |
| <a name="module_keyvault_certificate_requests"></a> [keyvault\_certificate\_requests](#module\_keyvault\_certificate\_requests) | ./modules/security/keyvault_certificate_request | n/a |
| <a name="module_keyvault_certificates"></a> [keyvault\_certificates](#module\_keyvault\_certificates) | ./modules/security/keyvault_certificate | n/a |
| <a name="module_keyvault_keys"></a> [keyvault\_keys](#module\_keyvault\_keys) | ./modules/security/keyvault_key | n/a |
| <a name="module_keyvaults"></a> [keyvaults](#module\_keyvaults) | ./modules/security/keyvault | n/a |
| <a name="module_lighthouse_definitions"></a> [lighthouse\_definitions](#module\_lighthouse\_definitions) | ./modules/security/lighthouse_definition | n/a |
| <a name="module_load_balancers"></a> [load\_balancers](#module\_load\_balancers) | ./modules/networking/load_balancers | n/a |
| <a name="module_local_network_gateways"></a> [local\_network\_gateways](#module\_local\_network\_gateways) | ./modules/networking/local_network_gateways | n/a |
| <a name="module_log_analytics"></a> [log\_analytics](#module\_log\_analytics) | ./modules/log_analytics | n/a |
| <a name="module_log_analytics_diagnostics"></a> [log\_analytics\_diagnostics](#module\_log\_analytics\_diagnostics) | ./modules/diagnostics | n/a |
| <a name="module_logic_app_action_custom"></a> [logic\_app\_action\_custom](#module\_logic\_app\_action\_custom) | ./modules/logic_app/action_custom | n/a |
| <a name="module_logic_app_action_http"></a> [logic\_app\_action\_http](#module\_logic\_app\_action\_http) | ./modules/logic_app/action_http | n/a |
| <a name="module_logic_app_integration_account"></a> [logic\_app\_integration\_account](#module\_logic\_app\_integration\_account) | ./modules/logic_app/integration_account | n/a |
| <a name="module_logic_app_trigger_custom"></a> [logic\_app\_trigger\_custom](#module\_logic\_app\_trigger\_custom) | ./modules/logic_app/trigger_custom | n/a |
| <a name="module_logic_app_trigger_http_request"></a> [logic\_app\_trigger\_http\_request](#module\_logic\_app\_trigger\_http\_request) | ./modules/logic_app/trigger_http_request | n/a |
| <a name="module_logic_app_trigger_recurrence"></a> [logic\_app\_trigger\_recurrence](#module\_logic\_app\_trigger\_recurrence) | ./modules/logic_app/trigger_recurrence | n/a |
| <a name="module_logic_app_workflow"></a> [logic\_app\_workflow](#module\_logic\_app\_workflow) | ./modules/logic_app/workflow | n/a |
| <a name="module_machine_learning_workspaces"></a> [machine\_learning\_workspaces](#module\_machine\_learning\_workspaces) | ./modules/analytics/machine_learning | n/a |
| <a name="module_managed_identities"></a> [managed\_identities](#module\_managed\_identities) | ./modules/security/managed_identity | n/a |
| <a name="module_mariadb_servers"></a> [mariadb\_servers](#module\_mariadb\_servers) | ./modules/databases/mariadb_server | n/a |
| <a name="module_mssql_databases"></a> [mssql\_databases](#module\_mssql\_databases) | ./modules/databases/mssql_database | n/a |
| <a name="module_mssql_elastic_pools"></a> [mssql\_elastic\_pools](#module\_mssql\_elastic\_pools) | ./modules/databases/mssql_elastic_pool | n/a |
| <a name="module_mssql_elastic_pools_remote"></a> [mssql\_elastic\_pools\_remote](#module\_mssql\_elastic\_pools\_remote) | ./modules/databases/mssql_elastic_pool | n/a |
| <a name="module_mssql_failover_groups"></a> [mssql\_failover\_groups](#module\_mssql\_failover\_groups) | ./modules/databases/mssql_server/failover_group | n/a |
| <a name="module_mssql_managed_databases"></a> [mssql\_managed\_databases](#module\_mssql\_managed\_databases) | ./modules/databases/mssql_managed_database | n/a |
| <a name="module_mssql_managed_databases_backup_ltr"></a> [mssql\_managed\_databases\_backup\_ltr](#module\_mssql\_managed\_databases\_backup\_ltr) | ./modules/databases/mssql_managed_database/backup_ltr | n/a |
| <a name="module_mssql_managed_databases_restore"></a> [mssql\_managed\_databases\_restore](#module\_mssql\_managed\_databases\_restore) | ./modules/databases/mssql_managed_database | n/a |
| <a name="module_mssql_managed_instances"></a> [mssql\_managed\_instances](#module\_mssql\_managed\_instances) | ./modules/databases/mssql_managed_instance | n/a |
| <a name="module_mssql_managed_instances_secondary"></a> [mssql\_managed\_instances\_secondary](#module\_mssql\_managed\_instances\_secondary) | ./modules/databases/mssql_managed_instance | n/a |
| <a name="module_mssql_mi_administrators"></a> [mssql\_mi\_administrators](#module\_mssql\_mi\_administrators) | ./modules/databases/mssql_managed_instance/administrator | n/a |
| <a name="module_mssql_mi_failover_groups"></a> [mssql\_mi\_failover\_groups](#module\_mssql\_mi\_failover\_groups) | ./modules/databases/mssql_managed_instance/failover_group | n/a |
| <a name="module_mssql_mi_secondary_tde"></a> [mssql\_mi\_secondary\_tde](#module\_mssql\_mi\_secondary\_tde) | ./modules/databases/mssql_managed_instance/tde | n/a |
| <a name="module_mssql_mi_tde"></a> [mssql\_mi\_tde](#module\_mssql\_mi\_tde) | ./modules/databases/mssql_managed_instance/tde | n/a |
| <a name="module_mssql_servers"></a> [mssql\_servers](#module\_mssql\_servers) | ./modules/databases/mssql_server | n/a |
| <a name="module_mysql_servers"></a> [mysql\_servers](#module\_mysql\_servers) | ./modules/databases/mysql_server | n/a |
| <a name="module_netapp_accounts"></a> [netapp\_accounts](#module\_netapp\_accounts) | ./modules/netapp | n/a |
| <a name="module_network_security_groups"></a> [network\_security\_groups](#module\_network\_security\_groups) | ./modules/networking/network_security_group | n/a |
| <a name="module_network_watchers"></a> [network\_watchers](#module\_network\_watchers) | ./modules/networking/network_watcher | n/a |
| <a name="module_networking"></a> [networking](#module\_networking) | ./modules/networking/virtual_network | n/a |
| <a name="module_packer_service_principal"></a> [packer\_service\_principal](#module\_packer\_service\_principal) | ./modules/shared_image_gallery/packer_service_principal | n/a |
| <a name="module_postgresql_servers"></a> [postgresql\_servers](#module\_postgresql\_servers) | ./modules/databases/postgresql_server | n/a |
| <a name="module_private_dns"></a> [private\_dns](#module\_private\_dns) | ./modules/networking/private-dns | n/a |
| <a name="module_private_endpoints"></a> [private\_endpoints](#module\_private\_endpoints) | ./modules/networking/private_links/endpoints | n/a |
| <a name="module_proximity_placement_groups"></a> [proximity\_placement\_groups](#module\_proximity\_placement\_groups) | ./modules/compute/proximity_placement_group | n/a |
| <a name="module_public_ip_addresses"></a> [public\_ip\_addresses](#module\_public\_ip\_addresses) | ./modules/networking/public_ip_addresses | n/a |
| <a name="module_random_strings"></a> [random\_strings](#module\_random\_strings) | ./modules/random_string | n/a |
| <a name="module_recovery_vaults"></a> [recovery\_vaults](#module\_recovery\_vaults) | ./modules/recovery_vault | n/a |
| <a name="module_redis_caches"></a> [redis\_caches](#module\_redis\_caches) | ./modules/redis_cache | n/a |
| <a name="module_resource_group_reused"></a> [resource\_group\_reused](#module\_resource\_group\_reused) | ./modules/resource_group_reused | n/a |
| <a name="module_resource_groups"></a> [resource\_groups](#module\_resource\_groups) | ./modules/resource_group | n/a |
| <a name="module_route_tables"></a> [route\_tables](#module\_route\_tables) | ./modules/networking/route_tables | n/a |
| <a name="module_routes"></a> [routes](#module\_routes) | ./modules/networking/routes | n/a |
| <a name="module_service_health_alerts"></a> [service\_health\_alerts](#module\_service\_health\_alerts) | ./modules/monitoring/service_health_alerts | n/a |
| <a name="module_shared_image_galleries"></a> [shared\_image\_galleries](#module\_shared\_image\_galleries) | ./modules/shared_image_gallery/image_galleries | n/a |
| <a name="module_storage_account_blobs"></a> [storage\_account\_blobs](#module\_storage\_account\_blobs) | ./modules/storage_account/blob | n/a |
| <a name="module_storage_accounts"></a> [storage\_accounts](#module\_storage\_accounts) | ./modules/storage_account | n/a |
| <a name="module_subscription_billing_role_assignments"></a> [subscription\_billing\_role\_assignments](#module\_subscription\_billing\_role\_assignments) | ./modules/subscription_billing_role_assignment | n/a |
| <a name="module_subscriptions"></a> [subscriptions](#module\_subscriptions) | ./modules/subscriptions | n/a |
| <a name="module_synapse_workspaces"></a> [synapse\_workspaces](#module\_synapse\_workspaces) | ./modules/analytics/synapse | n/a |
| <a name="module_virtual_hub_er_gateway_connections"></a> [virtual\_hub\_er\_gateway\_connections](#module\_virtual\_hub\_er\_gateway\_connections) | ./modules/networking/virtual_hub_er_gateway_connection | n/a |
| <a name="module_virtual_hubs"></a> [virtual\_hubs](#module\_virtual\_hubs) | ./modules/networking/virtual_wan/virtual_hub | n/a |
| <a name="module_virtual_machine_scale_sets"></a> [virtual\_machine\_scale\_sets](#module\_virtual\_machine\_scale\_sets) | ./modules/compute/virtual_machine_scale_set | n/a |
| <a name="module_virtual_machines"></a> [virtual\_machines](#module\_virtual\_machines) | ./modules/compute/virtual_machine | n/a |
| <a name="module_virtual_network_gateway_connections"></a> [virtual\_network\_gateway\_connections](#module\_virtual\_network\_gateway\_connections) | ./modules/networking/virtual_network_gateway_connections | n/a |
| <a name="module_virtual_network_gateways"></a> [virtual\_network\_gateways](#module\_virtual\_network\_gateways) | ./modules/networking/virtual_network_gateways | n/a |
| <a name="module_virtual_wans"></a> [virtual\_wans](#module\_virtual\_wans) | ./modules/networking/virtual_wan | n/a |
| <a name="module_vpn_gateway_connections"></a> [vpn\_gateway\_connections](#module\_vpn\_gateway\_connections) | ./modules/networking/vpn_gateway_connection | n/a |
| <a name="module_vpn_sites"></a> [vpn\_sites](#module\_vpn\_sites) | ./modules/networking/vpn_site | n/a |
| <a name="module_wvd_application_groups"></a> [wvd\_application\_groups](#module\_wvd\_application\_groups) | ./modules/compute/wvd_application_group | n/a |
| <a name="module_wvd_applications"></a> [wvd\_applications](#module\_wvd\_applications) | ./modules/compute/wvd_applications | n/a |
| <a name="module_wvd_host_pools"></a> [wvd\_host\_pools](#module\_wvd\_host\_pools) | ./modules/compute/wvd_host_pool | n/a |
| <a name="module_wvd_workspaces"></a> [wvd\_workspaces](#module\_wvd\_workspaces) | ./modules/compute/wvd_workspace | n/a |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.ddos_protection_plan](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.host](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.peering](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.public_ip_addresses](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.route_tables](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.routes](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_app_service_virtual_network_swift_connection.vnet_config](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_bastion_host.host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_mssql_server_extended_auditing_policy.mssql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_mssql_server_extended_auditing_policy.mssqldb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server_extended_auditing_policy) | resource |
| [azurerm_network_ddos_protection_plan.ddos_protection_plan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan) | resource |
| [azurerm_role_assignment.for](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account_customer_managed_key.cmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key) | resource |
| [azurerm_storage_account_customer_managed_key.diasacmk](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key) | resource |
| [azurerm_virtual_hub_connection.vhub_connection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_connection) | resource |
| [azurerm_virtual_hub_route_table.route_table](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_hub_route_table) | resource |
| [azurerm_virtual_network_peering.peering](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [null_resource.delay](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [random_string.prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azuread_service_principal.front_door](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azuread_service_principal.logged_in_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault_secret.certificate_issuer_password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_management_group.level](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/management_group) | data source |
| [azurerm_storage_account.function_apps](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account.mssql_auditing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_storage_account.mssqldb_auditing](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/storage_account) | data source |
| [azurerm_subscription.primary](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_config"></a> [app\_config](#input\_app\_config) | n/a | `map` | `{}` | no |
| <a name="input_application_security_groups"></a> [application\_security\_groups](#input\_application\_security\_groups) | n/a | `map` | `{}` | no |
| <a name="input_azuread"></a> [azuread](#input\_azuread) | # Azure AD | `map` | `{}` | no |
| <a name="input_azuread_api_permissions"></a> [azuread\_api\_permissions](#input\_azuread\_api\_permissions) | n/a | `map` | `{}` | no |
| <a name="input_billing"></a> [billing](#input\_billing) | Billing information | `map` | `{}` | no |
| <a name="input_client_config"></a> [client\_config](#input\_client\_config) | n/a | `map` | `{}` | no |
| <a name="input_cloud"></a> [cloud](#input\_cloud) | Cloud configuration objects | `map` | `{}` | no |
| <a name="input_compute"></a> [compute](#input\_compute) | Compute configuration objects | `map` | <pre>{<br>  "virtual_machines": {}<br>}</pre> | no |
| <a name="input_cosmos_dbs"></a> [cosmos\_dbs](#input\_cosmos\_dbs) | n/a | `map` | `{}` | no |
| <a name="input_current_landingzone_key"></a> [current\_landingzone\_key](#input\_current\_landingzone\_key) | Key for the current landing zones where the deployment is executed. Used in the context of landing zone deployment. | `string` | `"local"` | no |
| <a name="input_custom_role_definitions"></a> [custom\_role\_definitions](#input\_custom\_role\_definitions) | Custom role definitions configuration objects | `map` | `{}` | no |
| <a name="input_data_factory"></a> [data\_factory](#input\_data\_factory) | n/a | `map` | `{}` | no |
| <a name="input_database"></a> [database](#input\_database) | Database configuration objects | `map` | `{}` | no |
| <a name="input_diagnostic_storage_accounts"></a> [diagnostic\_storage\_accounts](#input\_diagnostic\_storage\_accounts) | n/a | `map` | `{}` | no |
| <a name="input_diagnostics"></a> [diagnostics](#input\_diagnostics) | n/a | `map` | `{}` | no |
| <a name="input_diagnostics_definition"></a> [diagnostics\_definition](#input\_diagnostics\_definition) | Shared diadgnostics settings that can be used by the services to enable diagnostics | `any` | `null` | no |
| <a name="input_diagnostics_destinations"></a> [diagnostics\_destinations](#input\_diagnostics\_destinations) | n/a | `any` | `null` | no |
| <a name="input_dynamic_keyvault_secrets"></a> [dynamic\_keyvault\_secrets](#input\_dynamic\_keyvault\_secrets) | n/a | `map` | `{}` | no |
| <a name="input_enable"></a> [enable](#input\_enable) | Map of services defined in the configuration file you want to disable during a deployment. | `map` | `{}` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the CAF environment. | `string` | `"sandpit"` | no |
| <a name="input_event_hub_auth_rules"></a> [event\_hub\_auth\_rules](#input\_event\_hub\_auth\_rules) | n/a | `map` | `{}` | no |
| <a name="input_event_hub_consumer_groups"></a> [event\_hub\_consumer\_groups](#input\_event\_hub\_consumer\_groups) | n/a | `map` | `{}` | no |
| <a name="input_event_hub_namespace_auth_rules"></a> [event\_hub\_namespace\_auth\_rules](#input\_event\_hub\_namespace\_auth\_rules) | n/a | `map` | `{}` | no |
| <a name="input_event_hub_namespaces"></a> [event\_hub\_namespaces](#input\_event\_hub\_namespaces) | n/a | `map` | `{}` | no |
| <a name="input_event_hubs"></a> [event\_hubs](#input\_event\_hubs) | n/a | `map` | `{}` | no |
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | Global settings object for the current deployment. | `map` | <pre>{<br>  "default_region": "region1",<br>  "passthrough": false,<br>  "random_length": 4,<br>  "regions": {<br>    "region1": "southeastasia",<br>    "region2": "eastasia"<br>  }<br>}</pre> | no |
| <a name="input_image_definitions"></a> [image\_definitions](#input\_image\_definitions) | n/a | `map` | `{}` | no |
| <a name="input_keyvault_access_policies"></a> [keyvault\_access\_policies](#input\_keyvault\_access\_policies) | n/a | `map` | `{}` | no |
| <a name="input_keyvault_access_policies_azuread_apps"></a> [keyvault\_access\_policies\_azuread\_apps](#input\_keyvault\_access\_policies\_azuread\_apps) | n/a | `map` | `{}` | no |
| <a name="input_keyvault_certificate_issuers"></a> [keyvault\_certificate\_issuers](#input\_keyvault\_certificate\_issuers) | n/a | `map` | `{}` | no |
| <a name="input_keyvaults"></a> [keyvaults](#input\_keyvaults) | Key Vault configuration objects | `map` | `{}` | no |
| <a name="input_local_network_gateways"></a> [local\_network\_gateways](#input\_local\_network\_gateways) | n/a | `map` | `{}` | no |
| <a name="input_log_analytics"></a> [log\_analytics](#input\_log\_analytics) | n/a | `map` | `{}` | no |
| <a name="input_logged_aad_app_objectId"></a> [logged\_aad\_app\_objectId](#input\_logged\_aad\_app\_objectId) | Used to set access policies based on the value 'logged\_in\_aad\_app' | `string` | `null` | no |
| <a name="input_logged_user_objectId"></a> [logged\_user\_objectId](#input\_logged\_user\_objectId) | Used to set access policies based on the value 'logged\_in\_user'. Can only be used in interactive execution with vscode. | `string` | `null` | no |
| <a name="input_logic_app"></a> [logic\_app](#input\_logic\_app) | n/a | `map` | `{}` | no |
| <a name="input_managed_identities"></a> [managed\_identities](#input\_managed\_identities) | Managed Identity configuration objects | `map` | `{}` | no |
| <a name="input_networking"></a> [networking](#input\_networking) | Networking configuration objects | `map` | `{}` | no |
| <a name="input_packer_managed_identity"></a> [packer\_managed\_identity](#input\_packer\_managed\_identity) | n/a | `map` | `{}` | no |
| <a name="input_packer_service_principal"></a> [packer\_service\_principal](#input\_packer\_service\_principal) | n/a | `map` | `{}` | no |
| <a name="input_random_strings"></a> [random\_strings](#input\_random\_strings) | n/a | `map` | `{}` | no |
| <a name="input_remote_objects"></a> [remote\_objects](#input\_remote\_objects) | Remote objects is used to allow the landing zone to retrieve remote tfstate objects and pass them to the caf module | `map` | `{}` | no |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups) | Resource groups configuration objects | `map` | `{}` | no |
| <a name="input_role_mapping"></a> [role\_mapping](#input\_role\_mapping) | n/a | `map` | <pre>{<br>  "built_in_role_mapping": {},<br>  "custom_role_mapping": {}<br>}</pre> | no |
| <a name="input_security"></a> [security](#input\_security) | # Security variables | `map` | `{}` | no |
| <a name="input_shared_image_galleries"></a> [shared\_image\_galleries](#input\_shared\_image\_galleries) | n/a | `map` | `{}` | no |
| <a name="input_shared_services"></a> [shared\_services](#input\_shared\_services) | Shared services configuration objects | `map` | `{}` | no |
| <a name="input_storage"></a> [storage](#input\_storage) | Storage configuration objects | `map` | `{}` | no |
| <a name="input_storage_accounts"></a> [storage\_accounts](#input\_storage\_accounts) | # Storage variables | `map` | `{}` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `map` | `{}` | no |
| <a name="input_subscription_billing_role_assignments"></a> [subscription\_billing\_role\_assignments](#input\_subscription\_billing\_role\_assignments) | n/a | `map` | `{}` | no |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | n/a | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be used for this resource deployment. | `map(any)` | `null` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure AD Tenant ID for the current deployment. | `string` | `null` | no |
| <a name="input_tfstates"></a> [tfstates](#input\_tfstates) | Terraform states configuration object. Used in the context of landing zone deployment. | `map` | `{}` | no |
| <a name="input_use_msi"></a> [use\_msi](#input\_use\_msi) | Deployment using an MSI for authentication. | `bool` | `false` | no |
| <a name="input_user_type"></a> [user\_type](#input\_user\_type) | The rover set this value to user or serviceprincipal. It is used to handle Azure AD api consents. | `map` | `{}` | no |
| <a name="input_virtual_network_gateway_connections"></a> [virtual\_network\_gateway\_connections](#input\_virtual\_network\_gateway\_connections) | n/a | `map` | `{}` | no |
| <a name="input_virtual_network_gateways"></a> [virtual\_network\_gateways](#input\_virtual\_network\_gateways) | n/a | `map` | `{}` | no |
| <a name="input_webapp"></a> [webapp](#input\_webapp) | Web applications configuration objects | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aad_apps"></a> [aad\_apps](#output\_aad\_apps) | n/a |
| <a name="output_aks_clusters"></a> [aks\_clusters](#output\_aks\_clusters) | n/a |
| <a name="output_app_config"></a> [app\_config](#output\_app\_config) | n/a |
| <a name="output_app_service_environments"></a> [app\_service\_environments](#output\_app\_service\_environments) | n/a |
| <a name="output_app_service_plans"></a> [app\_service\_plans](#output\_app\_service\_plans) | n/a |
| <a name="output_app_services"></a> [app\_services](#output\_app\_services) | n/a |
| <a name="output_application_gateway_applications"></a> [application\_gateway\_applications](#output\_application\_gateway\_applications) | n/a |
| <a name="output_application_gateway_waf_policies"></a> [application\_gateway\_waf\_policies](#output\_application\_gateway\_waf\_policies) | n/a |
| <a name="output_application_gateways"></a> [application\_gateways](#output\_application\_gateways) | n/a |
| <a name="output_application_insights"></a> [application\_insights](#output\_application\_insights) | n/a |
| <a name="output_application_security_groups"></a> [application\_security\_groups](#output\_application\_security\_groups) | n/a |
| <a name="output_automations"></a> [automations](#output\_automations) | n/a |
| <a name="output_availability_sets"></a> [availability\_sets](#output\_availability\_sets) | n/a |
| <a name="output_azure_container_registries"></a> [azure\_container\_registries](#output\_azure\_container\_registries) | n/a |
| <a name="output_azuread_applications"></a> [azuread\_applications](#output\_azuread\_applications) | n/a |
| <a name="output_azuread_credential_policies"></a> [azuread\_credential\_policies](#output\_azuread\_credential\_policies) | n/a |
| <a name="output_azuread_credentials"></a> [azuread\_credentials](#output\_azuread\_credentials) | n/a |
| <a name="output_azuread_groups"></a> [azuread\_groups](#output\_azuread\_groups) | n/a |
| <a name="output_azuread_service_principal_passwords"></a> [azuread\_service\_principal\_passwords](#output\_azuread\_service\_principal\_passwords) | n/a |
| <a name="output_azuread_service_principals"></a> [azuread\_service\_principals](#output\_azuread\_service\_principals) | n/a |
| <a name="output_azuread_users"></a> [azuread\_users](#output\_azuread\_users) | n/a |
| <a name="output_azurerm_firewall_policies"></a> [azurerm\_firewall\_policies](#output\_azurerm\_firewall\_policies) | n/a |
| <a name="output_azurerm_firewall_policy_rule_collection_groups"></a> [azurerm\_firewall\_policy\_rule\_collection\_groups](#output\_azurerm\_firewall\_policy\_rule\_collection\_groups) | n/a |
| <a name="output_azurerm_firewalls"></a> [azurerm\_firewalls](#output\_azurerm\_firewalls) | n/a |
| <a name="output_client_config"></a> [client\_config](#output\_client\_config) | n/a |
| <a name="output_combined_objects_subscriptions"></a> [combined\_objects\_subscriptions](#output\_combined\_objects\_subscriptions) | n/a |
| <a name="output_container_groups"></a> [container\_groups](#output\_container\_groups) | n/a |
| <a name="output_cosmos_dbs"></a> [cosmos\_dbs](#output\_cosmos\_dbs) | n/a |
| <a name="output_data_factory"></a> [data\_factory](#output\_data\_factory) | n/a |
| <a name="output_data_factory_dataset_azure_blob"></a> [data\_factory\_dataset\_azure\_blob](#output\_data\_factory\_dataset\_azure\_blob) | n/a |
| <a name="output_data_factory_dataset_cosmosdb_sqlapi"></a> [data\_factory\_dataset\_cosmosdb\_sqlapi](#output\_data\_factory\_dataset\_cosmosdb\_sqlapi) | n/a |
| <a name="output_data_factory_dataset_delimited_text"></a> [data\_factory\_dataset\_delimited\_text](#output\_data\_factory\_dataset\_delimited\_text) | n/a |
| <a name="output_data_factory_dataset_http"></a> [data\_factory\_dataset\_http](#output\_data\_factory\_dataset\_http) | n/a |
| <a name="output_data_factory_dataset_json"></a> [data\_factory\_dataset\_json](#output\_data\_factory\_dataset\_json) | n/a |
| <a name="output_data_factory_dataset_mysql"></a> [data\_factory\_dataset\_mysql](#output\_data\_factory\_dataset\_mysql) | n/a |
| <a name="output_data_factory_dataset_postgresql"></a> [data\_factory\_dataset\_postgresql](#output\_data\_factory\_dataset\_postgresql) | n/a |
| <a name="output_data_factory_dataset_sql_server_table"></a> [data\_factory\_dataset\_sql\_server\_table](#output\_data\_factory\_dataset\_sql\_server\_table) | n/a |
| <a name="output_data_factory_linked_service_azure_blob_storage"></a> [data\_factory\_linked\_service\_azure\_blob\_storage](#output\_data\_factory\_linked\_service\_azure\_blob\_storage) | n/a |
| <a name="output_data_factory_pipeline"></a> [data\_factory\_pipeline](#output\_data\_factory\_pipeline) | n/a |
| <a name="output_data_factory_trigger_schedule"></a> [data\_factory\_trigger\_schedule](#output\_data\_factory\_trigger\_schedule) | n/a |
| <a name="output_databricks_workspaces"></a> [databricks\_workspaces](#output\_databricks\_workspaces) | n/a |
| <a name="output_dedicated_host_groups"></a> [dedicated\_host\_groups](#output\_dedicated\_host\_groups) | n/a |
| <a name="output_dedicated_hosts"></a> [dedicated\_hosts](#output\_dedicated\_hosts) | n/a |
| <a name="output_diagnostics"></a> [diagnostics](#output\_diagnostics) | Output diagnostics |
| <a name="output_disk_encryption_sets"></a> [disk\_encryption\_sets](#output\_disk\_encryption\_sets) | n/a |
| <a name="output_dns_zone_records"></a> [dns\_zone\_records](#output\_dns\_zone\_records) | n/a |
| <a name="output_dns_zones"></a> [dns\_zones](#output\_dns\_zones) | n/a |
| <a name="output_domain_name_registrations"></a> [domain\_name\_registrations](#output\_domain\_name\_registrations) | n/a |
| <a name="output_dynamic_keyvault_secrets"></a> [dynamic\_keyvault\_secrets](#output\_dynamic\_keyvault\_secrets) | n/a |
| <a name="output_express_route_circuit_authorizations"></a> [express\_route\_circuit\_authorizations](#output\_express\_route\_circuit\_authorizations) | Express Route Circuit Authorizations Keys output |
| <a name="output_express_route_circuits"></a> [express\_route\_circuits](#output\_express\_route\_circuits) | Express Route Circuit output |
| <a name="output_front_door_waf_policies"></a> [front\_door\_waf\_policies](#output\_front\_door\_waf\_policies) | n/a |
| <a name="output_front_doors"></a> [front\_doors](#output\_front\_doors) | n/a |
| <a name="output_function_apps"></a> [function\_apps](#output\_function\_apps) | n/a |
| <a name="output_global_settings"></a> [global\_settings](#output\_global\_settings) | n/a |
| <a name="output_integration_service_environment"></a> [integration\_service\_environment](#output\_integration\_service\_environment) | n/a |
| <a name="output_ip_groups"></a> [ip\_groups](#output\_ip\_groups) | n/a |
| <a name="output_keyvault_certificate_issuers"></a> [keyvault\_certificate\_issuers](#output\_keyvault\_certificate\_issuers) | n/a |
| <a name="output_keyvault_certificate_requests"></a> [keyvault\_certificate\_requests](#output\_keyvault\_certificate\_requests) | n/a |
| <a name="output_keyvault_certificates"></a> [keyvault\_certificates](#output\_keyvault\_certificates) | n/a |
| <a name="output_keyvault_keys"></a> [keyvault\_keys](#output\_keyvault\_keys) | n/a |
| <a name="output_keyvaults"></a> [keyvaults](#output\_keyvaults) | n/a |
| <a name="output_load_balancers"></a> [load\_balancers](#output\_load\_balancers) | n/a |
| <a name="output_log_analytics"></a> [log\_analytics](#output\_log\_analytics) | n/a |
| <a name="output_logic_app_action_custom"></a> [logic\_app\_action\_custom](#output\_logic\_app\_action\_custom) | n/a |
| <a name="output_logic_app_action_http"></a> [logic\_app\_action\_http](#output\_logic\_app\_action\_http) | n/a |
| <a name="output_logic_app_integration_account"></a> [logic\_app\_integration\_account](#output\_logic\_app\_integration\_account) | n/a |
| <a name="output_logic_app_trigger_custom"></a> [logic\_app\_trigger\_custom](#output\_logic\_app\_trigger\_custom) | n/a |
| <a name="output_logic_app_trigger_http_request"></a> [logic\_app\_trigger\_http\_request](#output\_logic\_app\_trigger\_http\_request) | n/a |
| <a name="output_logic_app_trigger_recurrence"></a> [logic\_app\_trigger\_recurrence](#output\_logic\_app\_trigger\_recurrence) | n/a |
| <a name="output_logic_app_workflow"></a> [logic\_app\_workflow](#output\_logic\_app\_workflow) | n/a |
| <a name="output_machine_learning_workspaces"></a> [machine\_learning\_workspaces](#output\_machine\_learning\_workspaces) | n/a |
| <a name="output_managed_identities"></a> [managed\_identities](#output\_managed\_identities) | n/a |
| <a name="output_mariadb_servers"></a> [mariadb\_servers](#output\_mariadb\_servers) | n/a |
| <a name="output_mssql_databases"></a> [mssql\_databases](#output\_mssql\_databases) | n/a |
| <a name="output_mssql_elastic_pools"></a> [mssql\_elastic\_pools](#output\_mssql\_elastic\_pools) | n/a |
| <a name="output_mssql_managed_databases"></a> [mssql\_managed\_databases](#output\_mssql\_managed\_databases) | n/a |
| <a name="output_mssql_managed_instances"></a> [mssql\_managed\_instances](#output\_mssql\_managed\_instances) | n/a |
| <a name="output_mssql_managed_instances_secondary"></a> [mssql\_managed\_instances\_secondary](#output\_mssql\_managed\_instances\_secondary) | n/a |
| <a name="output_mssql_servers"></a> [mssql\_servers](#output\_mssql\_servers) | n/a |
| <a name="output_mysql_servers"></a> [mysql\_servers](#output\_mysql\_servers) | n/a |
| <a name="output_netapp_accounts"></a> [netapp\_accounts](#output\_netapp\_accounts) | n/a |
| <a name="output_network_security_groups"></a> [network\_security\_groups](#output\_network\_security\_groups) | n/a |
| <a name="output_postgresql_servers"></a> [postgresql\_servers](#output\_postgresql\_servers) | n/a |
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_proximity_placement_groups"></a> [proximity\_placement\_groups](#output\_proximity\_placement\_groups) | n/a |
| <a name="output_public_ip_addresses"></a> [public\_ip\_addresses](#output\_public\_ip\_addresses) | n/a |
| <a name="output_random_strings"></a> [random\_strings](#output\_random\_strings) | n/a |
| <a name="output_recovery_vaults"></a> [recovery\_vaults](#output\_recovery\_vaults) | n/a |
| <a name="output_redis_caches"></a> [redis\_caches](#output\_redis\_caches) | n/a |
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | n/a |
| <a name="output_storage_account_blobs"></a> [storage\_account\_blobs](#output\_storage\_account\_blobs) | n/a |
| <a name="output_storage_accounts"></a> [storage\_accounts](#output\_storage\_accounts) | n/a |
| <a name="output_subscriptions"></a> [subscriptions](#output\_subscriptions) | n/a |
| <a name="output_synapse_workspaces"></a> [synapse\_workspaces](#output\_synapse\_workspaces) | n/a |
| <a name="output_virtual_hub_connection"></a> [virtual\_hub\_connection](#output\_virtual\_hub\_connection) | n/a |
| <a name="output_virtual_hub_route_table"></a> [virtual\_hub\_route\_table](#output\_virtual\_hub\_route\_table) | n/a |
| <a name="output_virtual_hubs"></a> [virtual\_hubs](#output\_virtual\_hubs) | Virtual hubs output |
| <a name="output_virtual_machine_scale_sets"></a> [virtual\_machine\_scale\_sets](#output\_virtual\_machine\_scale\_sets) | n/a |
| <a name="output_virtual_machines"></a> [virtual\_machines](#output\_virtual\_machines) | n/a |
| <a name="output_virtual_wans"></a> [virtual\_wans](#output\_virtual\_wans) | Virtual WAN output |
| <a name="output_vnets"></a> [vnets](#output\_vnets) | n/a |
| <a name="output_vpn_gateway_connections"></a> [vpn\_gateway\_connections](#output\_vpn\_gateway\_connections) | n/a |
| <a name="output_vpn_sites"></a> [vpn\_sites](#output\_vpn\_sites) | n/a |
| <a name="output_wvd_application_groups"></a> [wvd\_application\_groups](#output\_wvd\_application\_groups) | n/a |
| <a name="output_wvd_applications"></a> [wvd\_applications](#output\_wvd\_applications) | n/a |
| <a name="output_wvd_host_pools"></a> [wvd\_host\_pools](#output\_wvd\_host\_pools) | n/a |
| <a name="output_wvd_workspaces"></a> [wvd\_workspaces](#output\_wvd\_workspaces) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->