terraform {
  #required version of terraform needed
  required_version = ">=1.0"
}

#Placeholder for provider configuration
provider "local" {}

#example resource
#describes real world object we want to provision, will terraform what to do based on resource lifecycle (create, update or delete)
resource "local_file" "example" {
  #resource "<PROVIDER>_<TYPE>" "<NAME (what file will be named)>"
  #local_file is provider (local) and specific resource (file)
  #example is the name to reference this resource
  #configuration arguments:
  content = "hey bitches!"
  filename = "${path.module}/hello.txt" #this would be the terrformlessons folder?
}

#create random filename using random_pet
resource "random_pet" "filename"{
  length = 2
  seperator = "_"
}

resource "random_integer" "integer"{
  min = 1
  max = 100000
}


#terraform workflow
#terraform init - initialize working directory and downloads neccessary providers
#terraform plan - shows what terraform will do based on the configuration file, does not make any changes
#terraform apply - applies the changes to the infrastructure, will ask for confirmation before making changes
#terraform destroy - destroys the infrastructure, will ask for confirmation before making changes



