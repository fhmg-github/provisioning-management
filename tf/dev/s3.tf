module "demo_bucket" {
  source        = "../modules/s3"
  bucket_name   = "001-demo-bucket"
  force_destroy = true
}
/* 
module "s3_versioning" {
  source                          = "../modules/s3/bucket_versioning"
  s3_bucket_id                    = output.s3_bucket_id
  versioning_configuration_status = "enabled"
} */
