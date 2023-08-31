variable "aws_region" {
    description = "region value"
    default = "ap-south-1"

}

variable "KeyName" {
    description = "keyname"
    default = "test_key" 

}

variable "InstanceType" {
    description = "Insatncetype"
    default = "t2.micro" 

}

variable "SubnetId" {
    description = "subnetid"
    default = "subnet-00a37f795e5d6279c" 

}

variable "VpcId" {
    description = "vpcid"
    default = "vpc-0f826aecaf30b5e3b"

}