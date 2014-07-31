require "storagy/version"
require "storagy/railtie" if defined?(Rails)

module Storagy
  class BucketUrlError < StandardError ; end

  def self.set_aws_credentials_from_storagy
    if ENV['STORAGY_S3_BUCKET_URL'] and !(ENV['AWS_ACCESS_KEY_ID'] || ENV['AWS_SECRET_ACCESS_KEY'] )
      ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'] = get_aws_storagy_credentials
    else
      raise BucketUrlError, "Storagy bucket url STORAGY_S3_URL is not configured.\nMake sure you provisioned Storagy successfully."
    end
  end

  def self.get_aws_storagy_credentials config_url=ENV['STORAGY_S3_BUCKET_URL']
    parsed_url = URI.parse config_url
    return parsed_url.user, parsed_url.password
  rescue URI::InvalidURIError => exception
    keys = config_url.scan(/s3:\/\/(.*?:.*?)@s3\./).flatten.first.try {|e| e.split(':')}
    raise unless keys
    return keys.first, keys.last
  end
end
