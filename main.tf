provider "aws" {
region = "us-east-1"
access_key = "AKIA6N3RT3U7VHC5XGUS"
secret_key = "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"
}

resource "aws_instance" "one" {
ami = "ami-0aa7d40eeae50c9a9"
instance_type = "t2.medium"
  key_name        = "new123"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1a"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my swiggy application created by terraform infrastructurte by raham sir server-1" > /var/www/html/index.html
EOF
tags = {
Name = "swiggy-01"
}
}

resource "aws_instance" "two" {
ami = "ami-0aa7d40eeae50c9a9"
instance_type = "t2.medium"
  key_name        = "new123"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone = "us-east-1b"
  user_data       = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my swiggy application created by terraform infrastructurte by raham sir server-2" > /var/www/html/index.html
EOF
tags = {
Name = "swiggy-02"
}
}
