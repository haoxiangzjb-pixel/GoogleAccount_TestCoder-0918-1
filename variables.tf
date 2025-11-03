# Arquivo de variáveis do Terraform para entrada de usuário

variable "region" {
  description = "Região da nuvem onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instância para os recursos de computação"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Ambiente onde os recursos serão implantados (ex: dev, staging, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "O ambiente deve ser 'dev', 'staging' ou 'prod'."
  }
}

variable "instance_count" {
  description = "Número de instâncias a serem criadas"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags a serem aplicadas aos recursos"
  type        = map(string)
  default = {
    Owner = "team-name"
    Project = "project-name"
  }
}