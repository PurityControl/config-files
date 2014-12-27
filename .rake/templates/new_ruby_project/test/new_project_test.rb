require 'minitest/autorun'
require 'rake'

require 'new_project'

class TestNewProject < MiniTest::Unit::TestCase
  def setup
    #write setup stuff here
  end

  def teardown
    #write teardown stuff here
  end

  def test_new_project_exists
    assert NewProject.new
      "Expected to be able to create a NewProject instance"
  end

  def test_write_more_tests
    flunk "You need to start writing your tests..."
  end
end
