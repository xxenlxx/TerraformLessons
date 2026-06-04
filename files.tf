#count examples
resource "local_file" "countfiles"{
    count = 3
    #tell terraform to create 3 of these resources
    #want to make these unique
    filename = "${path.module}/data/count${count.index}"
    content = "file created using count"
}

