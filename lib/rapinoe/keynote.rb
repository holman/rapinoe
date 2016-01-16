module Rapinoe
  class Keynote
    attr_accessor :path
    attr_accessor :data

    # Create a new Keynote instance.
    #
    #   path - The path to the .key file on disk.
    #
    # Returns a Keynote.
    def initialize(path)
      @path = path
      extract_key_file
    end

    # Returns the file size of the Keynote file in bytes.
    def size
      File.size(path)
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
      File.open(path, 'wb') do |out|
        out.write(preview_data)
      end
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
