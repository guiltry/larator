$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'larator'
require caller_locations(1,1)[0].to_s[/spec\/(.*)_spec/, 1]
