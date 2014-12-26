require 'minitest/autorun'
require 'rake'

class TestRubyProject < MiniTest::Unit::TestCase
  def setup
    parent_dir = File.dirname(__FILE__) + '/..'
    Rake.application.init
    Rake.application.rake_require('ruby_project', [parent_dir])
  end

  def test_ruby_project_new_task_exists
    task = Rake::Task['project:ruby:new']
    assert task.invoke
  end
end
