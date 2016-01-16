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

  def test_name
    assert_equal "ice cream", @keynote.name
  end

  def test_size
    assert_equal 327378, @keynote.size
  end

  def test_slides
    assert_kind_of Rapinoe::Slide, @keynote.slides.first
  end

  def test_data
    assert_not_nil @keynote.data
  end

  def test_preview_data
    assert_equal 32858, @keynote.preview_data.size
  end

  def test_write_preview_to_file
    tempfile = "/tmp/rapinoe-test.jpg"

    refute File.exist?(tempfile)
    @keynote.write_preview_to_file(tempfile)

    assert File.exist?(tempfile)
    assert_operator File.size(tempfile), :>, 32858
  ensure
    File.delete tempfile
  end
end
