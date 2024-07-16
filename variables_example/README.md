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

variable "web_port" {
    description = "Web Port"
    default = 80
    type = number
}
