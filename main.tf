terraform {
  #required version of terraform needed
  required_version = ">=1.0"

  required_providers {
    random = {
      version = "3.6.3"
    }
    #can specify provider version u want to use
    #however, check teraform.lock.hcl to check version locked in
    # if need to change, terraform init -upgrade can change this, can check in terraform provider folder or lock folder after upgrade
    #or delete it and just run terraform init again
  }
}

#Placeholder for provider configuration
provider "local" {}

#example resource
#describes real world object we want to provision, will terraform what to do based on resource lifecycle (create, update or delete)
resource "local_file" "file1" {
  #resource "<PROVIDER>_<TYPE>" "<NAME (what file will be named)>"
  #local_file is provider (local) and specific resource (file)
  #example is the name to reference this resource
  #configuration arguments:
  content = "hey bitches!"
  filename = "${path.module}/files/${var.filename1}.txt" #this would be the terrformlessons folder?
}

#create random filename using random_pet
resource "random_pet" "filename"{
  length = 2
  separator = "_"
}

resource "random_integer" "integer"{
  min = 1
  max = 100000
}

resource "local_file" "random_pet_file" {
  filename = "${path.module}/files/${random_pet.filename.id}.txt"
  content = "Terraform Generated This SHIT (${random_integer.integer.result})"
}

output "pet_name" {
  value = random_pet.filename.id
}

output "integer" {
  value = random_integer.integer.result
}

#terraform workflow
#terraform init - initialize working directory and downloads neccessary providers
#terraform plan - shows what terraform will do based on the configuration file, does not make any changes
#terraform apply - applies the changes to the infrastructure, will ask for confirmation before making changes
#terraform destroy - destroys the infrastructure, will ask for confirmation before making changes



