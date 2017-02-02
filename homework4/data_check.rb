require 'minitest/autorun'
require 'minitest/pride'
require './load_data.rb'

class LoadDataTest < MiniTest::Test
  def test_initialize
    assert LoadData.new('homework.csv')
  end
end
