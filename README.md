A gem to help you generate an acceptance test DSL from your application domain, which then uses Rails ActionView convention of element id generation to find elements in the UI matching the object and method you have called. An example:


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
* require 'ubiquitous/base_model' in your /features/env.rb or spec_helper
* create an empty UI Version of your model class and inheirit from Ubiquitous::BaseModel, i.e.

    class MemberModel < Ubiquitous::BaseModel
    end

* ...and new it up outside of your tests for use later

    def member(index=0)
        MemberModel.new(Capybara.current_session, index)
	end



