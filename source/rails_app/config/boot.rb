ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'bootsnap/setup' unless ENV['DEBUG_MODE'] # Speed up boot time by caching expensive operations. ブレークポイントで止まらなくなるのでデバッグ時は使用しない。