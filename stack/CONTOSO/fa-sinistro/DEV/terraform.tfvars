resource_group_name = "RG-FUNCTION"
location = "eastus2"
storage_account_name = "example-stg-acc"
service_plan_name = "APP-SERVICE-PLAN"
function_app_name = "FUNCTION-APP-HML"
tags = {
  ENV         = "HML"
  Application = "APP"
  Terraform   = "Yes"
	}