output "website-url" {
  value = aws_s3_bucket_website_configuration.my-website.website_endpoint
}