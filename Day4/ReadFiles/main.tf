data "local_file" "city" {
	filename = "./city.txt"
}

output "cities" {
	value = "${data.local_file.city}" 
}
