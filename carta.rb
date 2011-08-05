require 'rasem'

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
    
    def mark
      Proc.new do
        line 0, 0, 1, 1
        line 0, 1, 1, 0
      end
    end
  end
  
  class Row
    def self.parse(pattern)
      result = []
      pattern.split(%r{,|\s+}).each do |element|
        if count_match_data = element.match(/^[0-9]+/)
          # slices the beginning number from the string and throws
          # its converted-to-integer-form into a variable
          count = element.slice!(count_match_data[0]).to_i
        else
          count = 1
        end
        stitch_name = element.to_sym
        count.times do
          result << Stitch.new(stitch_name)
        end
      end
      result
    end
  end
end