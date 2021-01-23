
// TODO what needs to be output?

// base bucket access for future content insertion
output "domain_bucket" {
  value = aws_s3_bucket.domain_bucket
}

// host zone access
output "route_53_site_zone" {
  value = data.aws_route53_zone.website_zone
}

// acm certificate access
output "acm_certificate" {
    value = data.aws_acm_certificate.wildcard_website 
}

// cloudfront cdn access
// I don't anticipate much use of this but 🤷
output "website_cdn" {
    value = aws_cloudfront_distribution.website_cdn_root
}