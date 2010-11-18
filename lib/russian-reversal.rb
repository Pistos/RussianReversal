require 'linguistics'
Linguistics::use( :en )

require 'open-uri'
require 'nokogiri'

module RussianReversal
  REGEXP_NONWORD = /[^a-zA-Z -]/
  VERBS_IGNORED = [ 'be', 'have', 'can', ]
  NOUNS_IGNORED = [ 'it', 'him', 'her', 'them', 'me', 'you', 'us', 'this', 'that', 'these', 'those', ]

  def self.strip( s )
    s.gsub( /\..*$/, '' )
  end

  def self.infinitive_of( verb )
    doc = Nokogiri::HTML( open( "http://www.oxfordadvancedlearnersdictionary.com/dictionary/#{verb}" ) )
    doc.search('div#relatedentries > ul > li').each do |e|
      pos_element = e.at('span.pos')
      if pos_element
        pos = pos_element.text.gsub( REGEXP_NONWORD, '' )
        return  if pos == 'modal verb' || pos == 'auxiliary verb'
        if pos == 'verb'
          v = e.at('span').children.first.text.strip
          if VERBS_IGNORED.include?( v )
            return
          else
            return v
          end
        end
      end
    end
  end

  def self.plural_of( noun )
    return nil  if NOUNS_IGNORED.include?( noun.downcase )

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

    nil
  end

  def self.reverse( s )
    sentence = s.en.sentence

    verb_ = nil
    if verb_.nil?
      if sentence.verb
        verb_ = strip( sentence.verb )
      end
    end
    sentence.linkages[0].words.each do |w|
      if w =~ /^(.+)\.v$/
        verb_ = $1
        break
      end
    end
    return  if verb_.nil?

    verb = infinitive_of( verb_ )
    return  if verb.nil?

    return  if sentence.object.nil?
    object = strip( sentence.object )
    return  if object =~ REGEXP_NONWORD
    plural = plural_of( object )
    return  if plural.nil?

    "#{plural} #{verb}"
  end
end