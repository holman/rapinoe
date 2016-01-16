module Rapinoe
  class Keynote
    attr_accessor :path

    # Create a new Keynote instance.
    #
    #   path - The path to the .key file on disk.
    #
    # Returns a Keynote.
    def initialize(path)
      @path = path
    end

    # Returns the file size of the Keynote file in bytes.
    def size
      File.size(path)
    end
  end
end
