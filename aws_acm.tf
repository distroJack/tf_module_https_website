
// Best to use established acm certificate 
// You can use terraform to create and validate certificates BUT
// They have a quota of 20 unique certs per year.
// If you generate more (through terraform apply and destroy) 
// You have to submit a request to increase your quote
// :(
// For now just init your cert in the AWS GUI with 2 domains
// The base domain specified by ${var.base_domain}
// A wildcard domain cert of form *.${var.base_domain}
data "aws_acm_certificate" "wildcard_website" {

  // AWS only supports ACM certs within the Virginia region for cloudfront usage
  provider = aws.us-east-1-region 

  domain      = var.base_domain
  statuses    = ["ISSUED"]
  most_recent = true
}