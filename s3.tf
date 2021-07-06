resource "aws_s3_bucket" "b" {
    bucket = "tf-s3-rockbesst"
    acl    = "public-read"
    website {
        index_document = "index.html"
            }
    policy = file("bucket_policy.json")
}

resource "aws_s3_bucket_object" "index" {
  key        = "index.html"
  acl    = "public-read"
  bucket     = aws_s3_bucket.b.id
  source     = "./files/site/index.html"
}
resource "aws_s3_bucket_object" "image" {
  key        = "IMG_3993.jpg"
  acl    = "public-read"
  bucket     = aws_s3_bucket.b.id
  source     = "./files/site/IMG_3993.jpg"
}