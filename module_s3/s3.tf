resource "aws_s3_bucket" "this" {
bucket = "bucketpaposika2137"

}
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_object" "object1" {
  for_each = fileset("html/","*")
  bucket = aws_s3_bucket.this.id
  key = each.value
  source = "html/${each.value}"
  etag = filemd5("html/${each.value}")
  content_type = "text/html"

}