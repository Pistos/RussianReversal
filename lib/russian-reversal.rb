require 'linguistics'
Linguistics::use( :en )

require 'open-uri'
require 'nokogiri'

module RussianReversal
  REGEXP_NONWORD = /[^a-zA-Z-]/

  def self.strip( s )
    s.gsub( /\..*$/, '' )
  end

  def self.infinitive_of( verb )
    doc = Nokogiri::HTML( open( "http://www.oxfordadvancedlearnersdictionary.com/dictionary/#{verb}" ) )
    doc.search('div#relatedentries > ul > li').each do |e|
      if e.at('span.pos').text.gsub( REGEXP_NONWORD, '' ) == 'verb'
        return e.at('span').children.first.text.strip
      end
    end
  end

  def self.plural_of( noun )
    doc = Nokogiri::HTML( open( "http://www.oxfordadvancedlearnersdictionary.com/dictionary/#{noun}" ) )

    plural_marker = doc.at('span.z_il')
    if plural_marker
      return plural_marker.parent.at('span.if').text
    end

    plural_marker = doc.at('span.xr')
    if plural_marker && plural_marker.text =~ /plural of/
      return noun
    end

    doc.search('div#relatedentries > ul > li').each do |e|
      if e.at('span.pos').text.gsub( REGEXP_NONWORD, '' ) == 'noun'
        return e.at('span').children.first.text.strip + 's'
      end
    end
  end

  def self.reverse( s )
    sentence = s.en.sentence

    verb_ = strip( sentence.verb )
    return  if verb_.nil?

    verb = infinitive_of( verb_ )
    return  if verb.nil?

    object = strip( sentence.object )
    return  if object =~ REGEXP_NONWORD
    plural = plural_of( object )
    return  if plural.nil?

    "#{plural} #{verb}"
  end
end