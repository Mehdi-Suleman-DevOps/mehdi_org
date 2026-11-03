output "public_ip_ids" {
  value = {
    for key, pip in azurerm_public_ip.todo_ip :
    key => pip.id
  }
}