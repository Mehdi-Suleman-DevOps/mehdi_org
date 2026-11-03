output "subnet_ids" {
  value = {
    for key, subnet in azurerm_subnet.todo_subnet :
    key => subnet.id
  }
}