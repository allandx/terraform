# terraform.tfvars
# Add users and groups as required
users = [
  { name = "Alice", role = "Developer", products = ["Alpha", "Gamma"] },
  { name = "Bob", role = "QA", products = ["Beta"] },
  { name = "Michael", role = "Developer", products = ["Beta"] },
  { name = "Mike", role = "QA", products = ["Beta", "Gamma"] },
  { name = "Terry", role = "Developer", products = ["Gamma"] },
  { name = "John", role = "QA", products = ["Alpha"] }, 
]

groups = ["Alpha", "Beta", "Gamma"]
