provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "my_instance" {
  ami             = "ami-0005e0cfe09cc9050" 
  instance_type   = "t2.micro"
  #key_name        = "Mag" 
  #iam_instance_profile        = aws_iam_instance_profile.session-manager-instance.id
  security_groups = ["sg-03e55f0b8518b357b"]
  #subnet_id = aws_subnet.main-sub.id

  tags = {
    Name = "Created with Jenkins"
  }
}