module "record" {
  source              = "../test"
  resource_group_name = var.resource_group_name
  domain_name         = var.domain_name
  dns_a_record        = var.dns_a_record
  dns_cname_record    = var.dns_cname_record
}
