dns_a_record = [
  {
    name    = "dns_a_record"
    ttl     = "300"
    records = ["10.0.180.17"]
  },
]

dns_cname_record = [
  {
    name   = "dns_cname_record"
    ttl    = "300"
    record = "contoso.com"
  },
]

resource_group_name = "agtest-rg"
domain_name         = "mydomain.com"
