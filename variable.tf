variable "resource_group_name" {
  type    = string
  default = "agtest-rg"
}


variable "domain_name" {
  type    = string
  default = "mydomain.com"
}

variable "dns_a_record" {
  type = list(object({
    name   = string
    ttl    = string
    records = list(string)
  }))
}

variable "dns_cname_record" {
  type = list(object({
    name   = string
    ttl    = string
    record = string
  }))
}
