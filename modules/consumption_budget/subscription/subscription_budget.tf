resource "azurerm_consumption_budget_subscription" "this" {
  name            = var.settings.name
  subscription_id = var.client_config.subscription_id
  amount         = var.settings.amount
  time_grain     = var.settings.time_grain

  time_period {
    start_date = try(var.settings.time_period.start_date, formatdate("YYYY-MM-01'T'00:00:00Z", timestamp()))
    end_date   = try(var.settings.time_period.end_date, timeadd(formatdate("YYYY-MM-01'T'00:00:00Z", timestamp()), "8760h"))
  }

  dynamic "notification" {
    for_each = try(var.settings.notifications, [])

    content {
      operator       = notification.value.operator
      threshold      = notification.value.threshold
      threshold_type = try(notification.value.threshold_type, "Actual")
      contact_emails = try(notification.value.contact_emails, [])
      contact_groups = try(notification.value.contact_groups, [])
      contact_roles  = try(notification.value.contact_roles, [])
      enabled        = try(notification.value.enabled, true)
    }
  }

  dynamic "filter" {
    for_each = try(var.settings.filter, null) == null ? [] : [1]

    content {
      dynamic "dimension" {
        for_each = try(var.settings.filter.dimensions, {})

        content {
          name     = dimension.value.name
          operator = try(dimension.value.operator, "In")
          values   = dimension.value.values
        }
      }

      dynamic "tag" {
        for_each = try(var.settings.filter.tags, {})

        content {
          name     = tag.value.name
          operator = try(tag.value.operator, "In")
          values   = tag.value.values
        }
      }
    }
  }
}
