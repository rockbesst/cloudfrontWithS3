resource "aws_s3_bucket" "b" {
    acl    = "public-read"
    website {
        index_document = "index.html"
            }
}

resource "aws_s3_bucket_object" "index" {
  key        = "index.html"
  bucket     = aws_s3_bucket.b.id
  source     = "/files/site/index.html"
}
resource "aws_s3_bucket_object" "image" {
  key        = "IMG_3993.jpg"
  bucket     = aws_s3_bucket.b.id
  source     = "/files/site/IMG_3993.jpg"
}