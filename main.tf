resource "aws_instance" "app_server" {
  ami           = "ami-0866a3c8686eaeeba"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.aws-ag1.id]  # Remove quotes, making it a list
  key_name = aws_key_pair.key-tf.key_name
  associate_public_ip_address =  true

  tags = {
    Name = "tf-web1"
  }
}

output "file_output" {
  value = file("${path.module}/testdata.txt")
}

resource "aws_key_pair" "key-tf" {
  key_name   = "tf-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_security_group" "aws-ag1" {
  name = "terraform-aws-SG"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 81
    to_port     = 81
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# output "key_path" {
#   value = "${path.module}/id_rsa.pub"
# }