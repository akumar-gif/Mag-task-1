resource "aws_internet_gateway" "mag-gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"

   tags = {
    Name = "Magtech-IGW"
  }
}

