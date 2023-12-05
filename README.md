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
    
```
The above directory structure consist of a common child module hosted under modules/iam_users/. Assuming only a single environment is required(dev), the child module is called and the input variables are passed using terraform.tfvars. 

The parent module is hosted under dev/common/iam/ which includes the storing of its remote statefile and terraform.tfvars. This allows logical seperation of the IAM related resources which is common amongst all team.


## Quickstart
To create resources

```bash
cd dev/common/iam/
terraform init
# May require additional information such as aws credentials
terraform plan
# Applying plan
terraform apply 
```
To destroy resources
```bash
cd dev/common/iam/
terraform init
terraform destroy
```




