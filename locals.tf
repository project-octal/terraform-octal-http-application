resource "random_pet" "instance_id" {}
locals {
  labels = merge(var.labels, {
    "app.kubernetes.io/name"       = var.name
    "app.kubernetes.io/instance"   = random_pet.instance_id.id
    "app.kubernetes.io/component"  = "octal-http-application"
    "app.kubernetes.io/part-of"    = var.chart_name
    "app.kubernetes.io/managed-by" = "terraform"
  })
}