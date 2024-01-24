terraform {

  cloud {
    organization = "SphereVC"

    workspaces {
      name = "SphereVC_Project"
    }
  }
}

provider "aws" {
  region = "us-east-1"  
}