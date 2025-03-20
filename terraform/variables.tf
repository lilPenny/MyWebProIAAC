variable "myIp" {
  description = "value of my ip"
  type        = string
  sensitive   = true
}

variable "region" {
  default = "us-east-1"
}

variable "zone" {
  default = "us-east-1a"
}

# In case if I want to specify specific AMI for each region
variable "amiId" {
  type = map(string)
  default = {
    "us-east-1" = "ami-04b4f1a9cf54c11d0"
    "us-east-2" = ""
  }
}

variable "ssh_Public_Key" {
  type = string
  sensitive = true
}

variable "cloudflare_ips" {
  type    = list(string)
  default = [
    "103.21.244.0/22",
    "103.22.200.0/22",
    "103.31.4.0/22",
    "104.16.0.0/13",
    "104.24.0.0/14",
    "108.162.192.0/18",
    "131.0.72.0/22",
    "141.101.64.0/18",
    "162.158.0.0/15",
    "172.64.0.0/13",
    "173.245.48.0/20",
    "188.114.96.0/20",
    "190.93.240.0/20",
    "197.234.240.0/22",
    "198.41.128.0/17"
  ]
}