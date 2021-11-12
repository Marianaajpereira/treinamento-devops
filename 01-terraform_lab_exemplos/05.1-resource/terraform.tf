terraform {
  backend "remote" {
    organization = "mariana"

    workspaces {
      name = "workspace-mariana"
    }
  }
}
