variable "client_config" {
  description = "Client configuration object (must contain subscription_id)"
  type = object({
    subscription_id = string
  })
}

variable "settings" {
  description = "Configuration object for the consumption budget subscription"
  type = object({
    name = string
    amount = number
    time_grain = string
    time_period = optional(object({
      start_date = optional(string)
      end_date = optional(string)
    }))
    notifications = optional(list(object({
      operator = string
      threshold = number
      threshold_type = optional(string)
      contact_emails = optional(list(string))
      contact_groups = optional(list(string))
      contact_roles = optional(list(string))
      enabled = optional(bool)
    })))
    filter = optional(object({
      dimensions = optional(map(object({
        name = string
        operator = optional(string)
        values = list(string)
      })))
      tags = optional(map(object({
        name = string
        operator = optional(string)
        values = list(string)
      })))
    }))
  })
}
