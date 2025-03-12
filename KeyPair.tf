resource "aws_key_pair" "instanceKey" {
  key_name   = "instanceKey"
  public_key = "var.ssh_public_key"
}