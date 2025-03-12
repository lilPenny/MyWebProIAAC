resource "aws_instance" "web" {
  ami                    = var.amiId[var.region] != "" ? var.amiId[var.region] : data.aws_ami.amiId[0].id
  instance_type          = "t2.micro"
  key_name               = "instanceKey"
  vpc_security_group_ids = [aws_security_group.web-sg.id]
  availability_zone      = var.zone
  tags = {
    Name = "webInstance"
  }
}