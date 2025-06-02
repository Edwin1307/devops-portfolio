# S3 Bucket for hosting
resource "aws_s3_bucket" "portfolio" {
  bucket = var.bucket_name

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  tags = {
    Name        = "Portfolio Site"
    Environment = "Dev"
  }
}

# S3 Bucket Policy to make the site public
resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.portfolio.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = ["${aws_s3_bucket.portfolio.arn}/*"]
      }
    ]
  })
}
