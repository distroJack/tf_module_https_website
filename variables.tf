
// Base domain name desired (ex. example.com)
variable "base_domain" {}

// Local path to the static pages you wish to serve on your site
// Default to index.html and error.html as index and error response
variable "static_path" {}

// Propagate the current aws profile down to s3 sync call
variable "profile" {}