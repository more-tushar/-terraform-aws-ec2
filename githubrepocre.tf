resource "github_repository" "github-repo-public" {
  name = "terraform-eg-public"
  description = "My terrform code base"
  visibility = "public"
}

resource "github_repository" "github-repo-private" {
  name = "terraform-eg-private"
  description = "My terrform code base"
  visibility = "public"
}
