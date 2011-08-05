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
  
  describe "#mark" do
    it 'returns a set of rasem instructions' do
      stitch = Carta::Stitch.new(:sc)
      Rasem::SVGImage.new(100, 100, &(stitch.mark)).
      should_not raise_error
    end
    
    it 'accurately describes the shape of the stitch' do
      stitch = Carta::Stitch.new(:sc)
      Rasem::SVGImage.new(100, 100, &(stitch.mark)).
        output.scan(%r{<line}).
        length.should == 2
    end
    it 'accurately describes the position of the stitch'
    it 'accurately describes the size of the stitch'
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
    
    it 'converts a string containing two comma-delimited stitch abbreviations into a two-element array' do
      result = Carta::Row.parse('sc,hdc')
      result.class.should == Array
      result.length.should == 2
    end
    
    it 'converts a string containing three whitespace-delimited stitch abbreviations into a three-element array' do
      # three elements used so we could test against two
      # different types of whitespace
      result = Carta::Row.parse("sc   hdc\tdc")
      result.class.should == Array
      result.length.should == 3
    end
  end
end