####################################################
# Variable Declaration
#################################################### 

# For AWS provider
variable "AWS_REGION" {
  default     = "us-east-1"
  description = "Default AWS Region"
}

variable "shared_credentials_file" {
  default     = "C:/Users/Training/.aws/credentials"
  description = "Shared AWS credintials file location"
}

variable "profile" {
  default     = "default"
  description = "Name of profile"
}

variable "AMIS" {
  default = {
    us-east-1 = "ami-0323c3dd2da7fb37d"
  }
}