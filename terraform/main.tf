provider "aws" {
	region = "us-east-1"
}

resource "aws_lambda_function" "ruby-user-service" {
	function_name = "RubyUserService"
	s3_bucket = "ruby-user-service"
	s3_key = "ruby-user-service.zip"
	handler = "app.handler"
	runtime = "ruby2.5"
	role = aws_iam_role.lambda_role.arn
	timeout = 30
	layers = [
		"arn:aws:lambda:us-east-1:424056311453:layer:honeycomb-lambda-extension:86"
	]
	environment {
		variables = {
			LIBHONEY_API_KEY = "API_KEY"
			LIBHONEY_DATASET = "ruby-user-service-two"
			LOGS_API_DISABLE_PLATFORM_MSGS = true
		}
	}
}

resource "aws_iam_role" "lambda_role" {
	name = "lambda_role"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "lambda.amazonaws.com"
			},
			"Effect": "Allow",
			"Sid": ""
		}
	]
}
EOF
}
