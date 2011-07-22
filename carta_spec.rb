require 'carta.rb'

describe Carta::Stitch do
  it 'has a slug' do
    stitch = Carta::Stitch.new(nil)
    stitch.respond_to?(:slug).should be_true
  end
  
  it 'accepts valid crochet stitch abbreviations as slugs' do
    stitch = Carta::Stitch.new(:dc)
    stitch.slug.should == :dc
  end
  
  it 'does not accept invalid crochet stitch abbreviations as slugs' do
    stitch = Carta::Stitch.new(:abracadabra)
    stitch.slug.should == :INVALID_STITCH
  end
end

describe Carta::Row do
  describe '.parse' do
    it 'converts a string containing a single stitch abbreviation into a single-element array containing the correct Carta::Stitch' do
      result = Carta::Row.parse('sc')
      result.class.should == Array
      result.length.should == 1
      result[0].class.should == Carta::Stitch
      result[0].slug.should == :sc
    end
    
    it 'converts a string containing a single multiplied stitch abbreviation into an array of the appropriate length containing the correct Carta::Stitch-es' do
      # a multi-digit number makes sure that the code is capturing
      # the entire number rather than the first digit
      result = Carta::Row.parse('11tr')
      result.class.should == Array
      result.length.should == 11
      result.each do |stitch|
        stitch.class.should == Carta::Stitch
        stitch.slug.should == :tr
      end
    end
  end
end