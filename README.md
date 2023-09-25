# Provisioning Management Repository

This repository contains files and configurations for provisioning various infrastructure components, including servers, network resources, storage, edge devices, and more.

## References
## AWS Provider Documentation

For provisioning resources on AWS, this project uses the [HashiCorp AWS provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs). To configure AWS credentials for Terraform, you have two options:

1. [Shared Credentials File](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#shared-configuration-and-credentials-files): You can store your AWS credentials in a shared credentials file.

2. [Environment Variables](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables): Alternatively, you can set AWS credentials as environment variables.

## Vault Integration

Vault is used for secure secret management. If you're unfamiliar with Vault, you can learn more about it [here](https://developer.hashicorp.com/vault/docs/what-is-vault).

To get started with Vault, you'll need to install it. You can download the latest version of Vault [here](https://developer.hashicorp.com/vault/downloads).

Feel free to explore the content and configurations in this repository to manage your infrastructure effectively.
