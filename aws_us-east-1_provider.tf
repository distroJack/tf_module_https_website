
provider "aws" {
  alias  = "us-east-1-region"
  region = "us-east-1"
  profile = var.profile
}