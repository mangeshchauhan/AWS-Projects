variable "project" {
  description = "Project or environment name"
  type        = string
}

variable "db_user" {
  description = "Master DB username"
  type        = string
}

variable "db_password" {
  description = "Master DB password"
  type        = string
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_instance_class" {
  description = "Instance type for RDS"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "security_group" {
  description = "Security group ID for RDS"
  type        = string
}
variable "allocated_storage" {
  description = "The amount of storage (in GB) to allocate for the RDS DB instance"
  type        = number
}
