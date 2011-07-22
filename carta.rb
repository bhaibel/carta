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
      if count_match_data = pattern.match(/^[0-9]+/)
        # slices the beginning number from the string and throws
        # its converted-to-integer-form into a variable
        count = pattern.slice!(count_match_data[0]).to_i
      else
        count = 1
      end
      stitch_name = pattern.to_sym
      result = []
      count.times do
        result << Stitch.new(stitch_name)
      end
      result
    end
  end
end