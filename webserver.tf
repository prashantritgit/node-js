resource "aws_instance" "webserver" {
  ami                    = "ami-09d95fab7fff3776c"  # Update this to a valid Ubuntu AMI ID for your region
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id] 

  # Associate a public IP address
  associate_public_ip_address = true

  # Nginx installation script using user_data
  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
   EOF

  tags = {
    Name = "webserver"
  }
}

  

