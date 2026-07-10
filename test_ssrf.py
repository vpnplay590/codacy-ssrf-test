# Test file for Bandit and Ruff
import requests
import os

# Bandit should detect this
password = "secret123"
api_key = os.environ.get("API_KEY")

# Make HTTP request (to test if analysis container makes external calls)
response = requests.get("http://169.254.169.254/latest/meta-data/")
print(response.text)
