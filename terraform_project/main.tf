resource "aws_instance" "example_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = "my-key-pair"

  tags = {
    Name = "ExampleVM"
  }

  # Пример блока подключения к сети
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-12345678"
}