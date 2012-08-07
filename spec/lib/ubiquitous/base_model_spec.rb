require 'ubiquitous/base_model'
require 'action_view'
require 'action_view/helpers'

describe Ubiquitous::BaseModel do

  before :each do
    @session = mock
    @instance_tag_mock = mock(ActionView::Helpers::InstanceTag)
  end

  it "should attempt to find an element based on model and method name" do
    @session.should_receive(:find).with(:id, "member_0_surname")
    @instance_tag_mock.should_receive(:tag_id_with_index).and_return("member_0_surname")
    ActionView::Helpers::InstanceTag.should_receive(:new).and_return(@instance_tag_mock)

    class Member
      def surname
      end
    end

    member = Ubiquitous::BaseModel.new(@session, 0, Member.new)
    member.surname

  end

  it "should throw an error if the method doesn't exist on the desired model" do

    class Thingy
    end

    thingy = Ubiquitous::BaseModel.new(@session, 0, Thingy.new)
    begin
      thingy.surname
    rescue => e
     e.message.should == "this method, \"surname\" doesn't exist on the Thingy model"
    end

  end


end


