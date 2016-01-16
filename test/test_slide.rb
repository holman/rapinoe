require 'test/unit'
require 'lib/rapinoe'
include Rapinoe

class TestSlide < Test::Unit::TestCase
  def setup
    @keynote = Keynote.new('test/fixtures/ice-cream.key')
    @slide   = @keynote.slides.first
  end

  def test_preview_data
    assert_equal 1484, @slide.preview_data.size
  end

  def test_write_preview_to_file
    tempfile = "/tmp/rapinoe-slide-preview.jpg"

    refute File.exist?(tempfile)
    @slide.write_preview_to_file(tempfile)

    assert File.exist?(tempfile)
    assert_operator File.size(tempfile), :>, 1484
  ensure
    File.delete tempfile
  end
end
