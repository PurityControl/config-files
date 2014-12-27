require 'minitest/autorun'
require 'rake'

class TestRubyProject < MiniTest::Unit::TestCase
  def setup
    @project_directory = '/tmp/ruby_project'
    parent_dir = File.dirname(__FILE__) + '/..'
    Rake.application.init
    Rake.application.rake_require('ruby_project', [parent_dir])
    @task = Rake::Task['project:ruby:new']
    @task.reenable
  end

  def teardown
    FileUtils.remove_dir(@project_directory, true)
  end

  def test_ruby_project_new_task_exists
    assert @task.invoke(@project_directory),
      "The rake task was expected to be found"
  end

  def test_creates_root_directory
    @task.invoke(@project_directory)
    assert Dir.exists?(@project_directory),
      "The project directory must have been created"
  end

  def test_creates_test_directory
    @test_directory = File.join(@project_directory, 'test')
    @task.invoke(@project_directory)
    assert Dir.exists?(@test_directory),
      "The project directory must have a test directory"
  end

  def test_creates_lib_directory
    @lib_directory = File.join(@project_directory, 'lib')
    @task.invoke(@project_directory)
    assert Dir.exists?(@lib_directory),
      "The project directory must have a lib directory"
  end

  def test_creates_Rakefile
    @rakefile = File.join(@project_directory, 'Rakefile')
    @task.invoke(@project_directory)
    assert File.exists?(@rakefile),
      "The project directory must have a Rakefile"
  end

  def test_creates_new_project_file
    @new_project_file = File.join(@project_directory, 'lib', 'new_project.rb')
    @task.invoke(@project_directory)
    assert File.exists?(@new_project_file),
      "The project directory must have a new project file"
  end

  def test_creates_new_project_test_file
    @new_project_test_file = File.join(@project_directory,
      'test', 'new_project_test.rb')
    @task.invoke(@project_directory)
    assert File.exists?(@new_project_test_file),
      "The project directory must have a new project test file"
  end

  def test_creates_new_gemfile
    @gemfile = File.join(@project_directory, 'Gemfile')
    @task.invoke(@project_directory)
    assert File.exists?(@gemfile),
      "The project directory must have a Gemfile"
  end
end
