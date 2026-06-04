#count examples
resource "local_file" "countfiles"{
    count = 3
    #tell terraform to create 3 of these resources
    #want to make these unique
    filename = "${path.module}/data/count${count.index}"
    content = "file created using count"
}

# for each examples
#define data file names in terraform.tfvars
resource "local_file" "datafiles" {
    for_each = toset(var.data_filenames)
    #tell terraform to create a resource for each item in the list
    filename = "${path.module}/data/${each.value}"
    content = "this is the content for ${each.value}"
#each.value is the value of the current item in the list, each.key would be the index of the current item in the list from data_filenames
}

resource "local_file" "datamap" {
    for_each = var.data_objects_map
    #tell terraform to create a resource for each item in the map
    filename = "${path.module}/data/${each.key}"
    content = each.value.content
}