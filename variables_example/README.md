# **Terraform Variables**
Input variables allow you customize aspects of Terraform without using hard-coded values in the source.

## **Declaring a variable**
Variable declarations can appear anywhere in your configuration files. However, it's recommended to put them into a separate file called variables.tf.

### variable declaration
variable "vpc_cidr_block" {
   description = "CIDR block for VPC".
   default = "192.168.0.0/16"
   type = string
}

Assigning values to variables
1. Using the default argument in the variable declaration block.
2. Assign a value to the variable in the variable definition file which by default is terraform.tfvars.
   Example: vpc_cidr_block = "172.16.0.0/16"
3. Using -var command-line option.
   Example: terraform apply -var="vpc_cidr_block=10.0.10.0/24"
4. Using -var-file command-line option.
   Example: terraform apply -auto-approve -var-file=web-prod.tfvars
5. Exporting the variable at the terminal.
   Example: export TF_VAR_vpc_cidr_block="192.168.100.0/24"

Variable definition precedence (from highest to lowest):

1.Variables specified at the terminal using** -var** and -var-file options.
2.Variables defined in terraform.tfvars.
3.Variables defined as environment variables using TF_VAR prefix.

String Interpolation
- You can interpolate other values in strings by these values in ${}, such as ${var.foo}.
- The interpolation syntax is powerful and allows you to reference variables, attributes of resources, call functions, etc.
- You can escape interpolation with double dollar signs: $${foo} will be rendered as a literal ${foo}.

## **Variable Types**
1. Simple types **a**. number **b**. string **c**. bool **d**. null
2. Complex types **a**. Collection types i. list ii. map iii. set b. Structural types i. tuple object

### type number
```
variable "web_port" {
    description = "Web Port"
    default = 80
    type = number
}
```
### type string
```
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "eu-central-1"
}
```
### type bool
```
variable "enable_dns" {
  description = "DNS Support for the VPC"
  type = bool
  default = true
}
```
### type list (of strings)
```
variable "azs" {
  description = "AZs in the Region"
  type = list(string)
  default = [ 
      "eu-central-1a", 
      "eu-central-1b", 
      "eu-central-1c" 
      ]
}
```

### type map
```
variable "amis" {
  type = map(string)
  default = {
    "eu-central-1" = "ami-0dcc0ebde7b2e00db",
    "us-west-1" = "ami-04a50faf2a2ec1901"
  }
}
```

### Type tuple
```
variable "my_instance" {
    type = tuple([string, number, bool])  
    default = ["t2.micro", 1, true ]
}
```

### Type object
```
variable "egress_dsg" {
    type = object({
        from_port = number
        to_port = number
        protocol = string
        cidr_blocks = list(string)
    })
    default = {
     from_port = 0,
     to_port = 65365,
     protocol = "tcp",
     cidr_blocks = ["100.0.0.0/16", "200.0.0.0/16", "0.0.0.0/0"]
    }
}
```

