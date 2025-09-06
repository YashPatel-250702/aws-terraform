

resource "random_id" "randomId" {
  byte_length = 8
}


 
resource "aws_s3_bucket" "sampleBucket" {
  bucket = "${var.bucketName}-${random_id.randomId.hex}"
}
resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.sampleBucket.bucket
  key    = var.eacardKey
  source = var.eacardLocation
  
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.sampleBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "web-app-policy" {
  bucket = aws_s3_bucket.sampleBucket.id
  policy = jsonencode(
    {
      Version = "2012-10-17",
      Statement = [
        {
          Sid = "AllowPublicReadAccess",
          Effect = "Allow",
          Principal = "*",
          Action = "s3:GetObject",
          Resource = "arn:aws:s3:::${aws_s3_bucket.sampleBucket.id}/*"
        }
      ]
    }
  )
}