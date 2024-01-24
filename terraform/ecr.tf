
resource "aws_ecr_repository" "sphere_repo" {
  name = "sphere-ecr-repo"
  image_tag_mutability = "MUTABLE"  
}

output "repository_url" {
  value = aws_ecr_repository.sphere_repo.repository_url
}