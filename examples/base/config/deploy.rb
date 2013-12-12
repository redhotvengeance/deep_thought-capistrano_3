set :application, 'project-test'

if ENV['BRANCH']
  set :branch, ENV['BRANCH']
else
  set :branch, "master"
end

if ENV['BOX']
  set :branch, ENV['BOX']
end

if ENV['VARIABLES']
  vars = ENV['VARIABLES'].split(',')
  vars.each do |var|
    var = var.split('=')
    set :"#{var[0]}", var[1]
  end
end

I18n.enforce_available_locales = false

namespace :deploy do
  task :pass_test do
  end

  task :fail_test do
    updat
  end
end
