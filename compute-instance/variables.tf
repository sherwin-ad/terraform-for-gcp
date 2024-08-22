variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-a"
}


variable "machine_type" {
  type        = string
  description = "Machine Type"
  default     = "e2-micro"
}

variable "cidr" {
  type = string
  description = "IP cidr range"
}

variable "network_name" {
  type        = string
  description = "The name of the network."
