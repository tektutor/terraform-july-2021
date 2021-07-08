data "http" "weather" {
 	url = "https://www.metaweather.com/api/location/search/?lattlong=36.03,-84.03"


	request_headers = {
		"Accept" = "application/json"
	}
}
