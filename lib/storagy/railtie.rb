module Storagy
  class Railtie < Rails::Railtie
    initializer "storagy_railtie.configure_aws_keys_from_storagy" do
      Storagy.set_aws_credentials_from_storagy
    end
  end
end
