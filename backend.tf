terraform {
  backend "gcs" {
    bucket  = "terraform-project-kilyk"
    prefix  = "/dev/mnt/kilykira/OST_Dev"
  }
}
