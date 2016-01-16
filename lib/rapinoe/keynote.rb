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
