require File.expand_path '../test_helper.rb', __FILE__

class DeepThoughtCapistranoTest < MiniTest::Unit::TestCase
  def setup
    DatabaseCleaner.start

    if File.directory?(".projects/_test")
      FileUtils.rm_rf(".projects/_test")
    end

    DeepThought::Deploy.any_instance.stubs(:queue)

    @project = DeepThought::Project.create(:name => '_test', :repo_url => './test/fixtures/project-test')
    @user = DeepThought::User.create(:email => 'test@test.com', :password => 'secret', :password_confirmation => 'secret')
    @deploy = DeepThought::Deploy.create(:project_id => @project.id, :user_id => @user.id, :branch => 'master', :commit => '12345')
    @deployer = DeepThought::Deployer::Capistrano3.new
  end

  def teardown
    if File.directory?(".projects/_test")
      FileUtils.rm_rf(".projects/_test")
    end

    DatabaseCleaner.clean
  end

  def test_capistrano_execute_success
    @project.setup
    @deploy.actions = ['pass_test'].to_yaml
    assert @deployer.execute?(@deploy, {})
    assert @deploy.log
  end

  def test_capistrano_execute_failed
    @project.setup
    @deploy.actions = ['fail_test'].to_yaml
    assert !@deployer.execute?(@deploy, {})
    assert @deploy.log
  end
end
