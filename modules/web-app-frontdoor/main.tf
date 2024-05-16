resource "azurerm_linux_web_app" "webapp" {
  count                         = length(var.web_apps)
  name                          = var.web_apps[count.index]
  location                      = var.location
  resource_group_name           = var.grupo-recursos
  service_plan_id               = var.service_plan_id
  https_only                    = var.https-only
  tags                          = var.tags
  public_network_access_enabled = var.acesso-publico
  virtual_network_subnet_id     = var.subnet_id

  site_config {
    application_stack {
    node_version     = var.node_version
    }
    app_command_line = var.startup_command
    
	#Restrição de acesso fora da regra do Frontdoor
	ip_restriction_default_action = var.ip_restriction_default_action

	#Liberação de acesso ao painel SCM
	scm_ip_restriction_default_action       = var.scm_ip_restriction_default_action
   
   ip_restriction {
	#Regras do Frontdoor
      name        =  var.frontdoor-regra
      action      =  var.frontdoor-action
      priority    =  var.frontdoor-priority
      service_tag =  var.frontdoor-service-tag
	  
    }
  }
}