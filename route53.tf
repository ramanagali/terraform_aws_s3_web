// resource "aws_route53_zone" "primary" {
//   name = var.domain_name

//   tags {
//     Environment = var.environment
//   }
// }

// resource "aws_route53_record" "www" {
//   zone_id = aws_route53_zone.primary.zone_id
//   name    = var.domain_name
//   type    = "A"

//   alias {
//     name                   = aws_s3_bucket.test_bucket.website_domain
//     zone_id                = aws_s3_bucket.test_bucket.hosted_zone_id
//     evaluate_target_health = false
//   }
// }

resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    "Environment" = var.environment
  }
}

resource "aws_route53_record" "main-a-record" {
   zone_id    = aws_route53_zone.main.zone_id
   name       = var.domain_name
   type       = "A"

   alias {
    name                    = aws_s3_bucket.test_bucket.website_domain
    zone_id                 = aws_s3_bucket.test_bucket.hosted_zone_id
    evaluate_target_health  = false
  }
}

resource "aws_route53_record" "main-c-name" {
  zone_id   = aws_route53_zone.main.zone_id
  name      = "www"
  type      = "CNAME"
  ttl       = "300"
  records   = [var.domain_name]
}