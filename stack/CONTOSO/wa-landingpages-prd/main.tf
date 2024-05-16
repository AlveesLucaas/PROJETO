module "webapp-prd" {
  source          = "../../../modules/web-app-frontdoor"
  grupo-recursos  = var.grupo-recursos
  web_apps        = var.wa_names
  service_plan_id = var.service_plan_id
  tags            = var.tags
  startup_command = var.startup_command
  node_version    = var.node_version

}