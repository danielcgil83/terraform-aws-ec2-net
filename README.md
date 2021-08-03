# EC2 and Network creation on AWS

> Terraform code to create one EC2 instance and all the network necessary to access it from port 22.
![](https://dashboard.snapcraft.io/site_media/appmedia/2017/05/logo-terraform-38bd0e32.png) ![](https://assets.cloud.im/prod/ux1/images/logos/aws/aws-2x.png)

---
## Network Module
This code has a [network module](https://github.com/danielcgil83/terraform-aws-ec2-net/tree/main/network) that is called from the main terraform code.

The network infrastructure consists of:

- VPC
- Subnet
- Internet Gateway
- Route Table
- Route Table Association
- Security Group (with port 22 open)

---
## EC2 Instance
The [ec2.tf](https://github.com/danielcgil83/terraform-aws-ec2-net/blob/main/ec2.tf) code creates:
- a simple ec2 instance with  public IP so it can be accessed from port 22
- an ssh keypair on AWS that must be previously created on a Linux machine.

---
## AWS Profile
In [main.tf](https://github.com/danielcgil83/terraform-aws-ec2-net/blob/main/main.tf) file was used an AWS Profile to connect with this cloud provider, to understand how to configure this go to the [AWS Command Line Interface Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html).

---
## Variables
The main configuration has a [variables.tf](https://github.com/danielcgil83/terraform-aws-ec2-net/blob/main/variables.tf) file, it's necessary to inform these variables from command line or with a **terraform.tfvars** file.

- example terraform.tfvars structure:

```hcl
aws_region      = "eu-central-1"
aws_profile     = "terraform"
owner_name      = "Daniel Gil"
vpc_cidr_block  = "10.0.0.0/16"
sub_cidr_block  = "10.0.1.0/24"
instance_ami    = "ami-05f7491af5eef733a"
key_name        = "aws_ssh_key"
key_path        = "../../ssh-keys/aws_ssh_key"
public_key_path = "../../ssh-keys/aws_ssh_key.pub"
```

---
###### Contacts

Daniel Gil

[<img src="https://2.bp.blogspot.com/-T2mwdMnQkpI/W2pm1YXGMCI/AAAAAAAAIUU/jwi55-AuipczHEkxZ8KxrtvGU7ldTleeQCLcBGAs/s1600/mail-icon-iconfinder.png" width="50" height="50">](danielcgil83@gmail.com) [<img src="https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/60/26/7b/60267ba2-33d6-7d5e-7b61-056e9e448d4c/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/256x256bb.png" width="50" height="50">](https://www.linkedin.com/in/daniel-cardoso-gil/)