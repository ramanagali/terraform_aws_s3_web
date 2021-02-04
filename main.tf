resource "aws_s3_bucket" "test_bucket" {
  bucket = var.domain_name
  acl    = "public-read"
  policy = file("policy/bucketpolicy.json")

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    "Name"        = var.domain_name
    "Module"      = "XYZ"
    "Environment" = var.environment
  }

}

module "website" {
  source      = "./src"
}