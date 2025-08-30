
resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "static_website_bucket" {
  bucket        = "${var.BucketName}-${random_id.random_id.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.static_website_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
resource "aws_s3_bucket_policy" "web-app-policy" {
  bucket = aws_s3_bucket.static_website_bucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid = "AllowPublicReadAccess",
          Effect = "Allow",
          Principal = "*",
          Action = "s3:GetObject",
          Resource = "arn:aws:s3:::${aws_s3_bucket.static_website_bucket.id}/*"
        }
      ]
    }
  )
}

resource "aws_s3_bucket_website_configuration" "my-website" {
  bucket = aws_s3_bucket.static_website_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
}
resource "aws_s3_object" "styles_css" {
  bucket = aws_s3_bucket.static_website_bucket.id
  key    = "styles.css"
  source = "./styles.css"
  content_type = "text/css"
}
