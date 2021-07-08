data "local_file" "myfile" {
    filename = each.value
    for_each = var.files
}

output "display_file_contents" {
  value = data.local_file.myfile
}




