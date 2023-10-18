output "Nginx-URL" {
  value = "http://${module.lb.lb_dns_name}/"
}