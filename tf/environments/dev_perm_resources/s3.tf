module "demo_bucket" {
  source                          = "../../modules/s3"
  bucket_name                     = "this-project-demo"
  force_destroy                   = false
  s3_bucket_id                    = module.demo_bucket.s3_bucket_id
  bucket_exposure                 = "private"
  bucket_object_ownership         = "BucketOwnerPreferred"
  versioning_configuration_status = "Enabled"
}
