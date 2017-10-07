module "s3-website" {
  source          = "../../modules/s3-website"
  logging-bucket  = "${var.logging-bucket}"
  file-bucket     = "amylum-repo"
  redirect-bucket = "amylum-repo-redirect"
  write-user      = "circleci-amylum-repo"
  root-domain     = "repo.scrtybybscrty.org"
}

variable "logging-bucket" {
  type = "string"
}