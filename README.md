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
### Assumptions
- Both developers and QA roles requires identical permissions to access resources corresponding to their respective products – Alpha, Beta, and Gamma. The IAM group names also align with the product teams’ team for easy reference
- 1 environment - dev

### To add new users belonging to existing product team/group
- Update terraform.tfvars in dev/common/iam as below
```hcl
users = [
  { name = "Alice", role = "Developer", products = ["Alpha", "Gamma"] },
  { name = "Bob", role = "QA", products = ["Beta"] },
  { name = "Michael", role = "Developer", products = ["Beta"] },
  { name = "Mike", role = "QA", products = ["Beta", "Gamma"] },
  { name = "Terry", role = "Developer", products = ["Gamma"] },
  { name = "John", role = "QA", products = ["Alpha"] },
   ## add new user(s) here
  { name = "Tester", role = "QA", products = ["Alpha"] }
]

groups = ["Alpha", "Beta", "Gamma"]
```
### Verify that the groups, permissions, users are in place in aws platform after making changes
![image](https://github.com/allandx/terraform/assets/81692410/a1a6a6ae-ff35-49f8-bec3-8d5e7fa9ee80)



