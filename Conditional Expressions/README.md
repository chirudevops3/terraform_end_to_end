# Conditional Expressions

A conditional expression uses the value of a boolean expression to select one of two values.
```
Syntax : condition ? true_val : false_val
```
If condition is true then the result is true_val. If condition is false then the result is false_val.

Let’s assume that there are two resource blocks as part of terraform configuration.
Depending on the variable value, one of the resource blocks will run.

The condition can be any expression that resolves to a boolean value. This will usually be an expression that uses the equality, comparison, or logical operators.

```
variable "istest" {
    type = bool
    default = true
}

# Creating the test-server instance if `istest` equals true
resource "aws_instance" "test-server" {
  ami = "ami-05cafdf7c9f772ad2"
  instance_type = "t2.micro"
  count = var.istest == true ? 1:0  # conditional expression
}

# Creating the prod-server instance if `istest` equals false
resource "aws_instance" "prod-server" {
  ami = "ami-05cafdf7c9f772ad2"
  instance_type = "t2.large"   # it's not free tier eligible
  count = var.istest == false ? 1:0  # conditional expression
}
```