# Example 1
module "name_empty" {
  source = "../.."
}

# Example 2
module "suffix" {
  source        = "../.."
  suffix        = ["su", "fix"]
  unique-length = 20
}

# Example 3
module "random" {
  source      = "../.."
  unique-seed = module.suffix.unique-seed
}

# Example 4
module "everything" {
  source                 = "../.."
  prefix                 = ["pre", "fix"]
  suffix                 = ["su", "fix"]
  unique-seed            = "random"
  unique-length          = 2
  unique-include-numbers = false
}