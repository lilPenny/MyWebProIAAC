data "aws_ami" "amiId" {
  count = var.amiId[var.region] == "" ? 1 : 0 # only execute this data block if the amiId is not provided in the variables.tf

  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/*/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "instance_id" {
  description = "Value of the AMI ID"
  value       = var.amiId[var.region] != "" ? var.amiId[var.region] : data.aws_ami.amiId[0].id
}