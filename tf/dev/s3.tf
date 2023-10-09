module "demo_bucket" {
  source        = "../modules/s3"
  bucket_name   = "001-demo-bucket"
  force_destroy = true
}
