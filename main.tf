module "argocd_application" {
  source = "github.com/turnbros/terraform-argocd-application"

  argocd_namespace   = var.cluster_argocd_namespace
  destination_server = var.cluster_endpoint
  project            = var.project
  name               = var.name
  namespace          = var.namespace
  repo_url           = var.repo_url
  chart              = var.chart_name
  release_name       = var.release_name
  labels             = var.labels
}

module "ingress_route" {
  source = "github.com/turnbros/terraform-octal-ingress-route"

  name        = var.name
  namespace   = var.namespace
  cert_issuer = var.cluster_cert_issuer
  dns_name    = var.application_domain_name
  route_rules = var.route_rules
  labels      = var.labels
}