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
  end
end