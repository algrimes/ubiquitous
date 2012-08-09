# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ubiquitous/version"

Gem::Specification.new do |s|
  s.name        = "ubiquitous"
  s.version     = Ubiquitous::VERSION
  s.authors     = ["algrimes"]
  s.email       = ["agrimes@thoughtworks.com"]
  s.homepage    = "http://www.github.com/algrimes/ubiquitous"
  s.summary     = %q{Support to generate a test DSL from your Rails domain objects}
  s.description = %q{Unify your ui test and production domain model, to find elements in your UI 
                      that represent that model, without additional code. }

  s.rubyforge_project = "ubiquitous"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


end
