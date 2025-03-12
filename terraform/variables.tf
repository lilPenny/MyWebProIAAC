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
  type      = string
  sensitive = true
}
