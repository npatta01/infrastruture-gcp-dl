terraform {
  backend "gcs" {
    bucket  = "np-training-infrastructure"
    prefix  = "terraform/dl/etl"
  }
}
