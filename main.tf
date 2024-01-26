provider "aws" {
  region = "us-east-1" 
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Mag-VPC"
  }
}

resource "aws_subnet" "main-sub" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Mag-Subnet"
  }
}

resource "aws_route_table" "mag_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mag-gw.id
  }

  tags = {
    Name = "mag-route-table"
  }
}

# resource "aws_route_table_association" "example_association" {
#   subnet_id      = aws_subnet.main-sub.id
#   route_table_id = aws_route_table.mag_route_table.id
# }

resource "aws_security_group" "my_security_group" {
  name        = "MagTSecurityGroup"
  description = "Allow inbound SSH and outbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MagTSecurityGroup"
  }
}

# resource "aws_key_pair" "deployer" {
#   key_name   = "ne"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkhg3+D6fJOzyi3Uhw9j0g9+jS44aPD2V7yxjEYuVXAGx3TicLZczmM/8dg7jc2Nq+rRb0fZkgbEoK9N2lFI8CIeI1WMaHsxNf46AdgLYENpERsWZENrQKzdAQiKyU593P5JmF6TnAGKHs6InbAV7U84dbsrlGvpDNukn3YT+D6B0RhL9DU8jfUveb4ctVXrfOoWXt/Rp90RkK5bDKx/CwHu/vHLFar/8GQJjQlwPiaiWHRxKkM7p07e1UF/SHSG8AvnJFuye6c7OKzMoaxnKiAQx0LNjEXaA0mY+WcodS0HkNfaIoS8/h0tsKrdpVQGI2llKn4UOaDCS3NTZ4Xs/N aksha@Akshays-ROG-Strix"

# }

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "security_group_id" {
  value = aws_security_group.my_security_group.id
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
}