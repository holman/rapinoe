require 'fastimage'
require 'miro'
require 'zip'

require_relative 'rapinoe/keynote'
require_relative 'rapinoe/slide'

module Rapinoe
  VERSION = '0.0.4'

  def self.new(path)
    Keynote.new(path)
  end
end
