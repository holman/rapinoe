module Rapinoe
  class Keynote
    # The path where we can find the .key file.
    attr_accessor :path

    # The name of the file.
    attr_accessor :name

    # The (first stage) of uncompressed Keynote data in memory.
    attr_accessor :data

    # Create a new Keynote instance.
    #
    #   path - The path to the .key file on disk.
    #
    # Returns a Keynote.
    def initialize(path)
      @path = path
      @name = File.basename(path, ".key")
      extract_key_file
    end

    # Returns the file size of the Keynote file in bytes.
    def size
      File.size(path)
    end

    # The aspect ratio of the deck.
    #
    # Returns a Symbol, either :widescreen or :standard (4:3).
    def aspect_ratio
      path = "/tmp/rapinoe-aspect"
      write_preview_to_file(path)

      dimensions = FastImage.size(path)
      widescreen = (16/9.0)

      if widescreen == (dimensions[0] / dimensions[1].to_f)
        :widescreen
      else
        :standard
      end
    end

    # Is it widescreen? Does it blend?
    def widescreen?
      aspect_ratio == :widescreen
    end

    # The top colors present in the title slide.
    #
    # This returns a Hash of the color (in RGB) and its percentage in the frame.
    # For example:
    #
    #   {
    #     [1, 1, 1]   => 0.7296031746031746,
    #     [8, 12, 15] => 0.13706349206349205,
    #     [ … ]
    #   }
    def colors
      return @colors if @colors

      path = "/tmp/rapinoe-aspect"
      write_preview_to_file(path)

      colors = Miro::DominantColors.new(path)
      by_percentage = colors.by_percentage
      hash   = {}

      colors.to_rgb.each_with_index do |hex, i|
        hash[hex] = by_percentage[i]
      end

      @colors = hash
    end

    def slides
      @data.glob("Data/st*").map do |preview_jpg_data|
        Slide.new(preview_jpg_data.get_input_stream.read)
      end
    end

    # The binary data associated with the .jpg Keynote writes to make a
    # high(ish) quality preview version of the deck. You likely will want to
    # access this via #write_preview_to_file, unless you have specific needs for
    # the binary data.
    #
    # Returns the contents of preview.jpg.
    def preview_data
      @data.find_entry("preview.jpg").get_input_stream.read
    end

    # Writes Keynote's preview.jpg to disk somewhere.
    #
    #   path - The path to the new file you want to write.
    #
    # Returns nothing.
    def write_preview_to_file(path)
      FileUtils.mkdir_p(File.dirname(path))
      File.open(path, 'wb') do |out|
        out.write(preview_data)
      end
    end

    def inspect
      "<Rapinoe::Keynote: @name=\"#{@name}\", @path=\"#{@path}\", @data=[…]>"
    end

  private

    # .key files basically just try to masquerade as .zip files. Once we extract
    # the main directory structure (in memory), we can start looking into what's
    # inside.
    #
    # Returns a complex data structure that maps to Zip::File.
    def extract_key_file
      @data = Zip::File.open(path)
    end
  end
end
