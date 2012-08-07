# Copyright 2012 ThoughtWorks, Inc. Licensed under the MIT License

require 'ubiquitous/version'
require 'ubiquitous/base_model'

module Ubiquitous

  @finder_mechanism = :id

  def self.finder_mechanism=(finder_mechanism)
    @finder_mechanism  = finder_mechanism
  end


  def self.finder_mechanism
    @finder_mechanism
  end


end
