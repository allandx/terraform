# Terraform Assignment

## Scenario 1

### Directory Structure
```css
terraform/
├── dev
    └── alpha/
        ├── main.tf
        ├── variables.tf
        ├── provider.tf
        ├── backend.tf
        └── terraform.tfvars
    ├── beta/
        └── beta/
        ├── main.tf
        ├── variables.tf
        ├── provider.tf
        ├── backend.tf
        └── terraform.tfvars
        

├── modules/
    └── rds/
        ├── main.tf
        └── variables.t
    └── s3/
        ├── main.tf
        └── variables.t
```



## Scenario 2

### Directory Structure:
```css
terraform/
├── dev
    ├── common/
        └── iam/
            ├── main.tf
            ├── variables.tf
            ├── provider.tf
            ├── backend.tf
            └── terraform.tfvars

├── modules/
    ├── iam_users/
    │   ├── main.tf
    │   └── variables.tf
    └── rds/
        ├── main.tf
        └── variables.t
    └── s3/
         ├── main.tf
         └── variables.t
```
