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
    RussianReversal.reverse( 'The hungry lions were devouring a sheep.' ).should.equal 'sheep devour'
  end

  it 'remains silent on parse failures' do
    RussianReversal.reverse( 'He needs a NotARealEnglishWord' ).should.be.nil
  end

  it "doesn't activate on basic and auxiliary verbs" do
    RussianReversal.reverse( "There won't be a video." ).should.be.nil
    RussianReversal.reverse( "He has an object." ).should.be.nil
    RussianReversal.reverse( "He was a criminal." ).should.be.nil
  end
end