require 'test/unit'
require 'lib/rapinoe'
include Rapinoe

class TestKeynote < Test::Unit::TestCase
  def setup
    @keynote = Keynote.new('test/fixtures/ice cream.key')
  end

  def test_path
    assert_equal 'test/fixtures/ice cream.key', @keynote.path
  end

  def test_size
    assert_equal 327378, @keynote.size
  end
end
