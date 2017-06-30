# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     'AKIAIOOXRJFKS54HBQXA',                        # required
      aws_secret_access_key: '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',                        # required
      region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
      host:                  '',             # optional, defaults to nil
      endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'jinmo-inhalikelion-week9'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
