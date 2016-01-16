module Rapinoe
  # `Slide` is a really vague approximation. Keynote stores its data in a
  # zip-compressed file that has a bunch of .iwa files in it, which is where it
  # stores its data. Each of those .iwa files is a file that's been compressed
  # with a non-standard version of Google's Snappy compression format, and in
  # turn the resulting data is stored in Google's Protobuf interchange format.
  #
  # I think we could probably get pretty deep into this, but I couldn't get the
  # Ruby Snappy bindings to decompress the .iwa data (presumably due to the
  # lacking Stream Identifier chunk). Might be something we look into later and
  # see how many details we can glean from the full dataset.
  #
  # For more information, see @obriensp's excellent docs:
  #   https://github.com/obriensp/iWorkFileFormat/blob/master/Docs/index.md
  #
  # For now, we're going to instead look at the generated jpeg previews inside
  # the `Data/` subdirectory. It's a nasty approximation, but it should map
  # fairly well to the actual number of slides in the file.
  class Slide
    # The binary data representing the jpeg representation of this slide.
    attr_accessor :data

    def initialize(data)
      @data = data
    end

    # The contents of the preview jpeg, loaded into memory.
    #
    # Returns a string of the jpeg's binary data.
    def preview_data
      @data
    end

    # Writes the preview for this slide to disk.
    def write_preview_to_file(path)
      File.open(path, 'wb') do |out|
        out.write(preview_data)
      end
    end

    def inspect
      "<Rapinoe::Slide>"
    end
  end
end
