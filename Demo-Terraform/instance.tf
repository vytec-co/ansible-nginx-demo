 resource "aws_instance" "my-demo-web-server" {
  ami           = data.aws_ami.hellowordemo.id  #lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.my-public-sub-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.my-web-ssh-sg.id]

  # the public SSH key
  key_name = "demoKeyNV"
}


data "aws_ami" "hellowordemo" {
  most_recent = true
  owners           = ["self"]
  filter {
    name   = "name"
    values = ["HelloWorldDemo*"]
  }
}

output "publicip" {
  value = aws_instance.my-demo-web-server.public_ip
}

