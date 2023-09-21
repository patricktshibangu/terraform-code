resource "aws_lightsail_instance" "gitlab_test" {
  name              = "sns-qa"
  availability_zone = "us-east-1"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  key_pair_name     = "some_key_name"
  tags = {
    foo = "bar"
  }
}
user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF