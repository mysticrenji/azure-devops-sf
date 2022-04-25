resource "azurerm_service_fabric_managed_cluster" "sf_cluster" {
  sf_name           = var.sf_name
  sf_rg_name        = var.sf_rg_name
  location          = var.location
  http_gateway_port = 4567
  admin_username    = var.admin_username
  admin_password    = var.admin_password

  lb_rule {
    backend_port       = 38080
    frontend_port      = 80
    probe_protocol     = "http"
    probe_request_path = "/test"
    protocol           = "tcp"
  }
  client_connection_port = 12345

  node_type {
    data_disk_size_gb      = 130
    name                   = "disk1"
    primary                = true
    application_port_range = "30000-49000"
    ephemeral_port_range   = "10000-20000"

    vm_size            = "Standard_D2_v2"
    vm_image_publisher = "MicrosoftWindowsServer"
    vm_image_sku       = "2016-Datacenter"
    vm_image_offer     = "WindowsServer"
    vm_image_version   = "latest"
    vm_instance_count  = 3
  }
}