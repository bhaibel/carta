require 'carta.rb'

describe Carta::Stitch do
  it 'has a slug' do
    stitch = Carta::Stitch.new
    stitch.respond_to?(:slug).should be_true
  end
  
  it 'accepts valid crochet stitch abbreviations as slugs'
  it 'does not accept invalid crochet stitch abbreviations as slugs'
end