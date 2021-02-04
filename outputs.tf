output "website_domain" {
  value = "${aws_s3_bucket.test_bucket.website_domain}"
}

output "website_endpoint" {
  value = "${aws_s3_bucket.test_bucket.website_endpoint}"
}