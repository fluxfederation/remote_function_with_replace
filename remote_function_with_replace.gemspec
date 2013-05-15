# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "remote_function_with_replace/version"

Gem::Specification.new do |s|
  s.name          = "remote_function_with_replace"
  s.version       = RemoteFunctionWithReplace::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Will Bryant']
  s.email         = ['will.bryant@gmail.com']
  s.homepage      = 'https://github.com/powershop/remote_function_with_replace'
  s.summary       = "Extends Rails' remote_function to include a :replace action."
  s.description   = "Extends Rails' remote_function to include a :replace action."
  s.add_dependency 'actionpack', '>= 3.1.0'
  s.files         = %w(README MIT-LICENSE) + Dir["lib/**/*"]
  s.require_paths = ['lib']
end

