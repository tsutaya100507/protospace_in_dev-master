require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|

 config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    # aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    # aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    # region: 'ap-northeast-1'
    aws_access_key_id: ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region: ENV['S3_REGION']

  }

case Rails.env
when 'development'
  config.storage = :fog
  config.fog_directory = "proto-space-photo"
  config.asset_host ="https://s3-ap-northeast-1.amazonaws.com/proto-space-photo"

when 'production'
  config.storage = :fog
  config.fog_directory = "proto-space-photo"
  config.asset_host ="https://s3-ap-northeast-1.amazonaws.com/proto-space-photo"

when 'test'
  config.strage = :file
end
end
