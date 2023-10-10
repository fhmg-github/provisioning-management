module "demo_bucket" {
  source                          = "../../modules/s3"
  bucket_name                     = "001-demo-bucket"
  force_destroy                   = false
  s3_bucket_id                    = module.demo_bucket.s3_bucket_id
  bucket_exposure                 = "private"
  bucket_object_ownership         = "BucketOwnerPreferred"
  versioning_configuration_status = "Enabled"
}

/* module "s3_ownership" {
  source                  = "../../modules/s3/s3_bucket_ownership_control"
  s3_bucket_id            = module.demo_bucket.s3_bucket_id
  bucket_object_ownership = "BucketOwnerPreferred"
} */

/* module "s3_acl" {
  source          = "../../modules/s3/s3_bucket_acl"
  s3_bucket_id    = module.demo_bucket.s3_bucket_id
  bucket_exposure = "private"
  depends_on      = [module.s3_ownership.s3_ownership]
} */

/* module "s3_versioning" {
  source                          = "../../modules/s3/bucket_versioning"
  s3_bucket_id                    = module.demo_bucket.s3_bucket_id
  versioning_configuration_status = "Enabled"
} */
