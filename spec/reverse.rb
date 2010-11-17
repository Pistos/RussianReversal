require 'spec/preparation'

describe 'RussianReversal' do
  it 'can make the direct object the subject' do
    RussianReversal.reverse( 'They help Americans' ).should.equal 'Americans help'
    RussianReversal.reverse( 'He eliminated enemies' ).should.equal 'enemies eliminate'
    RussianReversal.reverse( 'He shot an apple' ).should.equal 'apples shoot'
    RussianReversal.reverse( 'He fired the rocket' ).should.equal 'rockets fire'
    RussianReversal.reverse( 'The cats chased the mice' ).should.equal 'mice chase'
    RussianReversal.reverse( 'The cat chases the mouse' ).should.equal 'mice chase'
    RussianReversal.reverse( 'The tanks decimated the platoon.' ).should.equal 'platoons decimate'
    RussianReversal.reverse( 'The chef prepared a delicious meal.' ).should.equal 'meals prepare'
  end
end