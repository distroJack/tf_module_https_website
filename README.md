# Module/https_website

## Purpose
A module that allows easy setup of an https static site on aws

# Testing/Examples:
Module tests/examples can be found here https://github.com/distroJack/tf_modules_tests/tree/main

## NOTES:
- You must have a valid route 53 host zone in your AWS account
	- Terraform generated host zones have invalid DNS records that differ from the DNS servers AWS assigns to your site
- You must have a valid acm certificate initialized
    - Certificate must cover base domain AND redirect domain
    - I recommend using the AWS ACM GUI and generating a cert that has the base domain (example.com) AND a wildcard record (*.example.com)
- You must have AWS cli installed to upload files to S3.
	- Terraform has S3 content resources but they aren't recursive and require manual metadata configuration

TODO: complete me please!