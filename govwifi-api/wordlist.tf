resource "aws_s3_bucket" "wordlist" {
  bucket = "govwifi-staging-temp-wordlist"
  count  = var.wordlist-bucket-count
  acl    = "private"

  tags = {
    Name = "wordlist-staging-temp-bucket"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket_object" "wordlist" {
  bucket = aws_s3_bucket.wordlist[0].bucket
  count  = var.wordlist-bucket-count
  key    = "wordlist-short"
  source = var.wordlist-file-path
  etag   = filemd5(var.wordlist-file-path)
}

resource "aws_iam_user_policy" "jenkins-read-wordlist-policy" {
  user  = aws_iam_user.jenkins-read-wordlist-bucket[0].name
  name  = "jenkins-read-wordlist-policy"
  count = var.wordlist-bucket-count

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.wordlist[0].bucket}/${aws_s3_bucket_object.wordlist[0].key}"
    }
  ]
}
EOF

}

resource "aws_iam_user" "jenkins-read-wordlist-bucket" {
  name  = "jenkins-read-wordlist-user"
  count = var.wordlist-bucket-count
}
