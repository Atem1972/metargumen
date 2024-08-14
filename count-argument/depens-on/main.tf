provider "aws" {
  region = "us-east-1"
}
/*
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Corrected: Use a list
  }

  owners = ["amazon"]  # Ensure you include owners to filter official Amazon AMIs
}

resource "aws_instance" "server" {
  count         = 2  # Create 2 EC2 instances

  ami           = data.aws_ami.amazon_linux_2.id  # Corrected: Reference the AMI ID from the data source dynamically
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-${count.index +1}"  # Tag instances based on the index
  }
}



    # this count is a metargument which means go and create me two instance in ec2 
  
     #this is to help us when requesting for output since is morethan one server we are creating
       #we can still write it like this "Dev-${count.index}" this will means in output it will be starting index0  

output "pub-ip" {
  value = aws_instance.server[0].public_ip
}                           #[*] 
                            #[1]
  */                          




  /*
  #we caan use locals can use local to declear a variable eg
  locals {    #this kind of variable declearation most be in the same file with the resource or block
    env = "dev"
  }  #eg

  output "V" {
    value = local.env
  }
  */


   /*
  resource "aws_iam_user" "n1" {
    count = 5
    name = "terraform-${count.index +1}"
  }
  */

      #declearing a variable and calling it
variable "usernames" {    #this variable will help u create many user on aws with diffn names
  type = list(string)
  default = [ "pter", "agbor", "susan"]
}

variable "instance_type" {  # this variable will help u spcifile which instance_type go to which server 
  default = ["t2.mcro", "t3.small", "t2.medium"]
}



  resource "aws_iam_user" "n1" {
    for_each = var.usernames
    name = each.key
  }

resource "aws_instance" "sv1" {
  for_each = var.instance_type
  ami = data.aws_ami.amazon_linux_2.id   # if the ami are to be diffn on the 3 instance we want to create then we can declear a variable for 
                                         # the ami and call it in the resource block same way we did for user, instance-type and group
instance_type = each.key
}                             