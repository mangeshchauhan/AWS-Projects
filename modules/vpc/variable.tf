variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
variable "private_subnet_cidrs" {
  type = list(string)
}