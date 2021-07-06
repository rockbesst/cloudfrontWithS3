provider "aws" {
	region = var.region
}

locals {
    origin_id = "S3"
}

resource "aws_cloudfront_distribution" "main_dist" {
    origin {
    #     custom_origin_config {
    #         http_port              = 80
    #         https_port             = 443
    #         origin_protocol_policy = "http-only"
    #         origin_ssl_protocols   = ["TLSv1.2"]
    # }
        domain_name = aws_s3_bucket.b.bucket_domain_name
        origin_id = local.origin_id
    }
    default_cache_behavior {
        allowed_methods = ["GET", "HEAD"]
        cached_methods = ["GET", "HEAD"]
        target_origin_id = local.origin_id
        viewer_protocol_policy = "allow-all"
        forwarded_values{
            query_string = false
            cookies {
                forward = "none"
            }
        }
    }
    enabled = true
    default_root_object = "index.html"
    restrictions {
        geo_restriction {
            restriction_type = "whitelist"
            locations = ["UA", "PL"]
        }
    }
    viewer_certificate {
        cloudfront_default_certificate = true
    }

}
output "bucket_dns" {
    value =aws_s3_bucket.b.bucket_domain_name  
}
output "bucket_web_endpoint" {
    value =aws_s3_bucket.b.website_endpoint  
}