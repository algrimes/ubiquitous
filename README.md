A gem to help you generate an acceptance test DSL from your application domain, which then uses Rails ActionView convention of element id generation to find elements in the UI matching the object and method you have called. An example:

Say you have a rails model, called Member. Calling the following code from your test:


    member.first_name


would return an element on the page like so:

    <input id="member_0_first_name" />


This also works for multiple instances of an object on a page:


    member(1).first_name


returns:

    <input id="member_1_first_name" />


## How to use:

* add 'ubiquitous' to your gemfile
* require 'ubiquitous/instance_tag' in /config/environment.rb
* add the following to your env.rb or spec_helper:

    require 'ubiquitous/base_model'
	require 'ubiquitous/model_helpers'
	World(Ubiquitous::ModelHelpers)






