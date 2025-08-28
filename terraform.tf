terraform {
	 required_providers {
	    aws = {
		 source = "hashicorp/aws"
		 version = "6.10.0"
    }
  }


	# when tfstate should be stored remotely
	#backend "s3" {
	#	bucket = "statetf-maintain-201525"
	#	key  = "terraform.tfstate"
	#	region = "us-east-2"
	#	dynamodb_table = "StateTF-dynamodb-table"


	#}
}