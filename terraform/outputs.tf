output "website_url" {
  value = "http://${aws_s3_bucket.portfolio.bucket}.s3-website.${var.aws_region}.amazonaws.com"
}
