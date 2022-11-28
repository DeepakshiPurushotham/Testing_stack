#### cisco-cml-on-aws ####
--------------------------
Providers:
---------
* aws

Resources:
---------
* aws_vpc
* aws_subnet
* aws_route_table
* aws_internet_gateway
* aws_security-group
* aws_iam_role
* aws_iam_policy
* aws_s3
* aws_eip
* aws_instance

Pre-requisties:
-------------
* Terraform 
* aws
* ssh-key:
  Generate ssh public key using following command:
   >> ssh-keygen -t rsa -b 4096 -C "cml-on-aws" -f ssh-key/id_rsa

  

CLI:
---
* To perform specific stack 
   >> terraform apply/destroy -target="module.<module_name>"

* To use environment based variables
   >> terraform apply/destroy -target="module.<module_name>" -var-file="<vars_file_name>"

