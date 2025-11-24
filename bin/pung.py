#!/usr/bin/env python3
import sys
import time

import requests


def check_site_availability(url):
    """Check if the site is available and return the status code."""
    try:
        response = requests.get(url, timeout=10)
        return response.status_code
    except requests.RequestException as e:
        return f"Error: {str(e)}"


# Use the first command-line argument as URL if provided, otherwise use default
if len(sys.argv) > 1:
    url = sys.argv[1]
else:
    url = "https://gitlab.lylo.tv/"

print(f"Checking {url} every 5 seconds until successful...")

while True:
    status = check_site_availability(url)
    print(f"Status: {status}")
    if isinstance(status, int) and 200 <= status < 300:
        print(f"Success! Site is available with status code {status}.")
        break
    time.sleep(5)
