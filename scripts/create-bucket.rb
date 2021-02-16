#!/usr/bin/env ruby
require 'securerandom'
require 'shellwords'

DEFAULT_REGION='us-east-2'
DEFAULT_ACL='private'
AWS_PROFILE='igolden'

bucket_key = SecureRandom.hex(18).to_s

puts "Bucket Key:", bucket_key 

str = "aws s3api create-bucket --acl private --bucket #{bucket_key} --region #{DEFAULT_REGION} --create-bucket-configuration LocationConstraint=#{DEFAULT_REGION}" 
exec(str)

