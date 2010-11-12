require 'linguistics'
Linguistics::use( :en )

module RussianReversal
  def self.strip( s )
    s.gsub( /\..*$/, '' )
  end

  def self.reverse( s )
    sentence = s.en.sentence
    object = strip( sentence.object )
    verb = strip( sentence.verb ).en.infinitive

    if object && verb
      "#{object.en.plural} #{verb} YOU!"
    end
  end
end