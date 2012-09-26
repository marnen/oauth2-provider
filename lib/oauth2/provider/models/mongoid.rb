module OAuth2::Provider::Models::Mongoid
  autoload :Authorization, 'oauth2/provider/models/mongoid/authorization'
  autoload :AccessToken, 'oauth2/provider/models/mongoid/access_token'
  autoload :AuthorizationCode, 'oauth2/provider/models/mongoid/authorization_code'
  autoload :Client, 'oauth2/provider/models/mongoid/client'

  mattr_accessor :client_collection_name
  self.client_collection_name = 'oauth_clients'

  mattr_accessor :access_token_collection_name
  self.access_token_collection_name = 'oauth_access_tokens'

  mattr_accessor :authorization_code_collection_name
  self.authorization_code_collection_name = 'oauth_authorization_codes'

  mattr_accessor :authorization_collection_name
  self.authorization_collection_name = 'oauth_authorizations'

  def self.activate(options = {})
    OAuth2::Provider.client_class_name ||= "OAuth2::Provider::Models::Mongoid::Client"
    OAuth2::Provider.access_token_class_name ||= "OAuth2::Provider::Models::Mongoid::AccessToken"
    OAuth2::Provider.authorization_code_class_name ||= "OAuth2::Provider::Models::Mongoid::AuthorizationCode"
    OAuth2::Provider.authorization_class_name ||= "OAuth2::Provider::Models::Mongoid::Authorization"

    OAuth2::Provider.client_class.store_in(:collection => client_collection_name)
    OAuth2::Provider.access_token_class.store_in(:collection => access_token_collection_name)
    OAuth2::Provider.authorization_code_class.store_in(:collection => authorization_code_collection_name)
    OAuth2::Provider.authorization_class.store_in(:collection => authorization_collection_name)
  end
end
