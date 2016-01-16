require 'test/unit'
require 'lib/rapinoe'

class TestRapinoe < Test::Unit::TestCase
  def setup
    @keynote = Rapinoe.new('test/fixtures/ice cream.key')
  end

  def test_quick_initializes
    assert_kind_of Rapinoe::Keynote, @keynote
  end
end
