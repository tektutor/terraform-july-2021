data "local_file" "myfile" {
    for_each = var.files
    filename = each.value
}

output "display_file_contents" {
  value = data.local_file.myfile
}




