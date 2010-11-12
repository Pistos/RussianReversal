require 'preparation'

describe 'RussianReversal' do
  it 'can identify the direct object' do
    RussianReversal.reverse( "He found car" ).should.equal 'cars find YOU!'
  end
end