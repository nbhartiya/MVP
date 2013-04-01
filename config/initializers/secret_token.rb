# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.

#MVP::Application.config.secret_token = '292cf7a95bbc6f55be8638839c9da346d7bb128f409e997f6793cf5b1dce2997c1ae30b91257bf63253ab443e17f8bf3a88f9e8cf12b344c8a13bd3e0d486f84'

# To Secure it soon:
if Rails.env.production?
  MVP::Application.config.secret_token = ENV['SECRET_TOKEN']
else
  MVP::Application.config.secret_token = '615889dec8fc9f92d1770d798520c464a43916a3425bfa149bdc788e4af4b9fcf788daebdf940a4dcfabda4663d339b1297ef0d13f93f01981700f052b62e847'
end
  
