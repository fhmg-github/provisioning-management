module "demo_bucket_state" {
  count         = var.bucket_state_perm_resource ? 1 : 0
  source        = "../../modules/s3/s3_bucket"
  bucket_name   = "this-demo-project"
  force_destroy = true
}

module "demo_ownership_control" {
  count                   = var.bucket_state_perm_resource ? 1 : 0
  source                  = "../../modules/s3/s3_bucket_ownership"
  s3_bucket_id            = module.demo_bucket_state[0].s3_bucket_id
  bucket_object_ownership = "BucketOwnerPreferred"
}

module "demo_bucket_acl" {
  count           = var.bucket_state_perm_resource ? 1 : 0
  source          = "../../modules/s3/s3_bucket_acl"
  s3_bucket_id    = module.demo_bucket_state[0].s3_bucket_id
  bucket_exposure = "private"
  depends_on      = [module.demo_ownership_control]
}

module "demo_bucket_versioning" {
  count                           = var.bucket_state_perm_resource ? 1 : 0
  source                          = "../../modules/s3/s3_bucket_versioning"
  s3_bucket_id                    = module.demo_bucket_state[0].s3_bucket_id
  versioning_configuration_status = "Enabled"
}