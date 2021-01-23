
// Best to use established route 53 zone
// AWS doesn't properly update DNS servers once a zone is deleted
// This forces manual effort no matter what. I prefer one and done on start.
data "aws_route53_zone" "website_zone" {
  name =  var.base_domain
}

// record for ${base_domain} site attached to CDN
resource "aws_route53_record" "website_cdn_root_record" {
  zone_id = data.aws_route53_zone.website_zone.zone_id
  name    = aws_s3_bucket.domain_bucket.id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_cdn_root.domain_name
    zone_id                = aws_cloudfront_distribution.website_cdn_root.hosted_zone_id
    evaluate_target_health = false
  }
}

// redirect record for www.${base_domain} site attached to CDN
resource "aws_route53_record" "website_cdn_redirect_record" {
  zone_id = data.aws_route53_zone.website_zone.zone_id
  name    = aws_s3_bucket.www_bucket.id
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.website_cdn_root.domain_name
    zone_id                = aws_cloudfront_distribution.website_cdn_root.hosted_zone_id
    evaluate_target_health = false
  }
}
