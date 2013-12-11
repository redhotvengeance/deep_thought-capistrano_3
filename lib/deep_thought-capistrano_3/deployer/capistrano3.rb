require 'deep_thought/deployer/deployer'

module DeepThought
  module Deployer
    class Capistrano3 < DeepThought::Deployer::Deployer
      def execute?(deploy, config)
        environment = deploy.environment || "development"

        cap_command = "cap #{environment} deploy"

        if deploy.actions
          actions = YAML.load(deploy.actions)
          actions.each do |action|
            cap_command += ":#{action}"
          end
        end

        cap_command += " BRANCH=#{deploy.branch}"
        cap_command += " BOX=#{deploy.box}" if deploy.box

        if deploy.variables
          cap_command += " VARIABLES="
          variables = YAML.load(deploy.variables)
          variables.each do |k, v|
            cap_command += "#{k}=#{v},"
          end
        end

        commands = []

        commands << "cd ./.projects/#{deploy.project.name}"
        commands << "#{cap_command} 2>&1"

        command = commands.join(" && ")

        log = `#{command}`

        deploy.log = log

        $?.success?
      end
    end
  end
end
