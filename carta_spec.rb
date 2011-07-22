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