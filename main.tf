data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_private_dns_zone" "dns" {
  name                = var.domain_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

# resource "azurerm_private_dns_a_record" "example" {
#   for_each            = var.dns_a_record
#   name                = each.value.name
#   zone_name           = azurerm_private_dns_zone.dns.name
#   resource_group_name = data.azurerm_resource_group.rg.name
#   ttl                 = each.value.ttl
#   records             = each.value.records 
# }

resource "azurerm_private_dns_a_record" "example" {
  for_each            = { for idx, record in var.dns_a_record : record.name => idx }
  name                = each.key
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = var.dns_a_record[each.value].ttl
  records             = var.dns_a_record[each.value].records 
}

resource "azurerm_private_dns_cname_record" "example" {
  for_each            = { for idx, record in var.dns_cname_record : record.name => idx }
  name                = each.key
  zone_name           = azurerm_private_dns_zone.dns.name
  resource_group_name = data.azurerm_resource_group.rg.name
  ttl                 = var.dns_cname_record[each.value].ttl
  record              = var.dns_cname_record[each.value].ttl
}
