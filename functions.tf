
resource "local_file" "data1" {
    #using conditional and fileexists, if it exists, make v2, if not then make original file
    filename = fileexists("${path.module}/data/data1") ? "${path.module}/data/data1_v2": "${path.module}/data/data1"
    content = "data1 version2"
}

#using timestamp
resource "local_file" "timestamp_file" {
    filename = "${path.module}/files/timestamp"
    content = timestamp()

    lifecycle {
        ignore_changes = [content]
        #tell terraform to ignore changes to the content argument, so it will not update the file every time we run terraform apply
    }
}

#using jsonencode
#taking things written in terraform HCL and convert it into JSON
resource "local_file" "jsonencode_file" {
    filename = "${path.module}/files/jsonencoded.json"
    content = jsonencode(
        {
            "hello" = "world"
            "name" = "eileen"
        }
    )
}