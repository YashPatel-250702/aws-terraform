

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