provider "aws" {
    alias 	= "source"

    region 	= "us-east-1"
    access_key  = "AKIA5ZKFJ54SESAHCZKV"
    secret_key  = "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"
}

provider "aws" {
   alias 	= "dest"

   region 	= "us-east-1"
   access_key 	= "AKIAYIMEDZZZNITWYLG7"
   secret_key  = "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"
}
