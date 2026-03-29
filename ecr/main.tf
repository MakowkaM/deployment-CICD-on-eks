resource "aws_ecr_repository" "hotstar" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

   tags = {
    Environment = "production"
    Service     = "hotstar"
  }
}