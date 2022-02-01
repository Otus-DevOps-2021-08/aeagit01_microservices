output "dashboard_endpoint" {
    value = "${helm_release.kubernetes-dashboard.id}"
}
