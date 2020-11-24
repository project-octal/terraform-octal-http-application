variable "project" {
  type        = string
  description = ""
}
variable "name" {
  type        = string
  description = ""
}
variable "namespace" {
  type        = string
  description = ""
}
variable "repo_url" {
  type        = string
  description = ""
}
variable "chart_name" {
  type        = string
  description = ""
}
variable "chart_version" {
  type = string
}
variable "release_name" {
  type        = string
  description = ""
}
variable "application_domain_name" {
  type        = string
  description = ""
}
variable "cluster_argocd_namespace" {
  type        = string
  description = "The namespace that ArgoCD was deployed in"
}
variable "cluster_endpoint" {
  type        = string
  description = "The cluster this OCTAL application will be deployed to"
}
variable "cluster_cert_issuer" {
  type        = string
  description = ""
}
variable "cluster_ingress_class" {
  type        = string
  description = ""
}
variable "automated_prune" {
  type        = bool
  description = "Specifies if resources should be pruned during auto-syncing"
  default     = false
}
variable "automated_self_heal" {
  type        = bool
  description = "Specifies if partial app sync should be executed when resources are changed only in target Kubernetes cluster and no git change detected"
  default     = false
}
variable "helm_values" {
  type = any
}
variable "route_rules" {
  type = list(object({
    match_rule : string,
    middlewares : list(object({
      name : string,
      namespace : string
    })),
    services : list(object({
      name : string,
      namespace : string,
      port : number,
      scheme : string
    }))
  }))
  default = null
}
variable "labels" {
  type        = map(string)
  description = ""
  default     = {}
}