variable "filename1" {
  type        = string
  description = "this is the filename for filename1."
}

variable "data_filenames" {
  type = list(string)
  description = "list of data file names"
}

#objects map
variable "data_objects_map" {
  type = map(object({
    content = string
  }))
  description = "map of data file names BLEH"
}
