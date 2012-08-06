# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ubiquitous/version"

Gem::Specification.new do |s|
  s.name        = "ubiquitous"
  s.version     = Ubiquitous::VERSION
  s.authors     = ["algrimes"]
  s.email       = ["agrimes@thoughtworks.com"]
  s.homepage    = ""
  s.summary     = %q{Support to generate a test DSL from your Rails domain objects}
  s.description = %q{The lofty ambitions of this gem are to unify your ui test and production
                    code's references to its domain model, and to find elements in your UI
                    that represent that model, without additional code. }

  s.rubyforge_project = "ubiquitous"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]


end
