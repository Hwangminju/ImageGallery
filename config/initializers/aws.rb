CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:     'AKIAIXSYD6FCQPK32WFQ',                        
    aws_secret_access_key: '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',                        
    region:                'us-east-2',
    endpoint:              'https://s3-us-east-2.amazonaws.com'
  }
  config.fog_directory  = 'imagesforgallery'
end