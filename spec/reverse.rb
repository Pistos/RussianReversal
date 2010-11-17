require 'spec/preparation'

describe 'RussianReversal' do
  it 'can identify the direct object' do
    RussianReversal.reverse( "They help Americans" ).should.equal 'Americans help'
    RussianReversal.reverse( "He eliminated enemies" ).should.equal 'enemies eliminate'
  end
end