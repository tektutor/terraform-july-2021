output "nashville" {
	value = jsondecode(data.http.weather.body)[0]
}
