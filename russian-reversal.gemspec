require 'rubygems'

spec = Gem::Specification.new do |s|
  s.name = 'russian-reversal'
  s.version = '1.0.5'
  s.summary = 'Takes simple English sentences and provides the Russian Reversal verb phrase'
  s.description = s.summary
  s.homepage = 'https://github.com/Pistos/RussianReversal'
  s.add_dependency 'linguistics'
  s.add_dependency 'linkparser'
  s.add_dependency 'nokogiri'

  s.authors = [ 'Pistos' ]

  s.files = [
    *( Dir[ 'lib/**/*.rb', 'spec/**/*.rb' ] )
  ]
  s.extra_rdoc_files = [
  ]
  s.test_files = Dir.glob( 'spec/*.rb' )
end
