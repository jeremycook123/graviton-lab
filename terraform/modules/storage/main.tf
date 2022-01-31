resource "aws_instance" "mongo" {
  
  #x86
  ami = "ami-02868af3c3df4b3aa"
  
  #arm64
  #ami = "ami-078278691222aee06"
  
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]

  user_data = filebase64("${path.module}/install.sh")

  tags = {
    Name  = "Mongo"
    Owner = "CloudAcademy"
  }
}
