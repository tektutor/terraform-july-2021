resource "local_file" "create_files" {
	filename = var.filename[count.index]
	count = length ( var.filename )
}
