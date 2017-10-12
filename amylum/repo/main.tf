module "s3-website" {
  source          = "../../modules/s3-website"
  logging-bucket  = "${var.logging-bucket}"
  file-bucket     = "amylum-repo"
  redirect-bucket = "amylum-repo-redirect"
  root-domain     = "repo.scrtybybscrty.org"
}

variable "logging-bucket" {
  type = "string"
}

output "site-dns-name" {
  value = "${module.s3-website.site-dns-name}"
}
