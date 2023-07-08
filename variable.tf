variable "aws_region" {
  description = "My Virginia Region VPC"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "ami" {
  description = "RHEL 8"
  default     = "ami-06640050dc3f556bb"
}

variable "instance_type" {
  description = "Environment instance Types"
  default     = "t2.micro"

}

variable "image_id" {
  description = "template image id"
  default     = "ami-0b0af3577fe5e3532"
}
