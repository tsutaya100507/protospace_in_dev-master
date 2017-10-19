CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAJ6Z44IIIOOVHCQ6A',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'proto-space-photo'
  config.cache_storage = :fog
end
