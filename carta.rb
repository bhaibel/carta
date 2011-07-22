module Carta
  class Stitch
    STITCH_ABBREVIATIONS = [:sc, :hdc, :dc, :tr]
    
    attr_reader :slug
    
    def initialize(a_slug)
      if STITCH_ABBREVIATIONS.include?(a_slug)
        @slug = a_slug
      else
        @slug = :INVALID_STITCH
      end
    end
  end
  
  class Row
    def self.parse(pattern)
      [Carta::Stitch.new(:sc)]
    end
  end
end