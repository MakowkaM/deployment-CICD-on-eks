variable "name" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ami_type" {
  type = string
}

variable "instance_types" {
  type = list(string)
}