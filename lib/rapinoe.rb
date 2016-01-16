require_relative 'rapinoe/keynote'

module Rapinoe
  VERSION = '0.0.1'

  def self.new(path)
    Keynote.new(path)
  end
end
