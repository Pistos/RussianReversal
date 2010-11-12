__DIR__ = File.dirname( File.expand_path( __FILE__ ) )
lib_dir = "#{__DIR__}/../lib"
if $LOAD_PATH[ 0 ] != lib_dir
  $LOAD_PATH.unshift lib_dir
end

require 'rubygems'
require 'bacon'
require 'russian-reversal'
