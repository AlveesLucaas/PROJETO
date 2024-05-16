#----------------------VARIAVEIS WEB APP----------------------------
grupo-recursos = "RG-WEBAPP"
wa_names       = ["app-01","app-01"]
tags = {
  ENV         = "PROD"
  Application = "LANDINGPAGE"
}

startup_command = "pm2 serve /home/site/wwwroot --no-daemon --spa"
node_version    = "20-lts"
https-only      = true
acesso-publico  = true