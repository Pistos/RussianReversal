require 'spec/preparation'

describe 'RussianReversal' do
  it 'can make the direct object the subject' do
    RussianReversal.reverse( 'They help Americans' ).should.equal 'Americans help'
    RussianReversal.reverse( 'He eliminated enemies' ).should.equal 'enemies eliminate'
    RussianReversal.reverse( 'He shot an apple' ).should.equal 'apples shoot'
    RussianReversal.reverse( 'He fired the rocket' ).should.equal 'rockets fire'
  end
end