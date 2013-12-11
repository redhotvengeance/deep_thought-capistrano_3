require 'deep_thought'
require 'deep_thought-capistrano_3/deployer/capistrano3'

module DeepThought
  DeepThought::Deployer.register_adapter('capistrano3', DeepThought::Deployer::Capistrano3)
end
