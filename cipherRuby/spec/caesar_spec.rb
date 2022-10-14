require './lib/caesarCipher.rb'

RSpec.describe "Caesar cipher" do
  it 'return shifting 5 characters' do
    expect(caesarCipher('If he',5)).to eql('Nk mj')
   end
end