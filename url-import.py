# Test if analysis engine follows URL imports
# URL: https://webhook.site/2caa5206-2135-4402-a5de-797ff032405c/url-import
import urllib.request

def test():
    urllib.request.urlopen('https://webhook.site/2caa5206-2135-4402-a5de-797ff032405c/python-urllib')
