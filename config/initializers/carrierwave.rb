if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
      region: ENV['AWS_REGION']
    }

    config.fog_directory = 'mmx_s3_bucket'
    config.fog_public = true
    config.fog_attributes = { 'Cache-Control' => 'public, max-age=86400' }
  end

else
  CarrierWave.configure do |config|
    config.storage = :file
  end
end