AWS_PROFILE=personal

build:
	zip ruby-user-service.zip app.rb
	AWS_PROFILE=${AWS_PROFILE} aws s3 cp ruby-user-service.zip s3://ruby-user-service/ruby-user-service.zip

