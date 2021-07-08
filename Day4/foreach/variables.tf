variable "files" {
	type = set(string)
	default = [ 
		"./file1.txt", 
		"./file2.txt",  
		"./file3.txt" 	
	]
}
