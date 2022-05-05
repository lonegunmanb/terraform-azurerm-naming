output "name_empty" {
  value = module.name_empty.storage_account.name_unique
}

output "suffix" {
  value = module.suffix.storage_account.name_unique
}

output "random" {
  value = module.random.storage_account.name_unique
}

output "everything" {
  value = module.everything.storage_account.name_unique
}

output "validation_everything" {
  value = module.everything.validation
}