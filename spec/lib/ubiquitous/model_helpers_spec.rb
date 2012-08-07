require 'ubiquitous/model_helpers'
require 'ubiquitous/base_model'

describe Ubiquitous::ModelHelpers do

  before :each do
    class Boat
    end

    class Car
    end
  end

  after :each do
    Object.send(:remove_const, :BoatModel) if Object.const_defined?(:BoatModel)
    Object.send(:remove_const, :CarModel) if Object.const_defined?(:CarModel)
  end


  it "should create a new class inheriting BaseModel for every Domain object found" do

    Ubiquitous::ModelHelpers.should_receive(:models).any_number_of_times.and_return([Boat, Car])
    Ubiquitous::ModelHelpers.create_classes
    "BoatModel".constantize.should == BoatModel
    BoatModel.superclass.should == Ubiquitous::BaseModel

  end

  it "should create a helper method for each model" do
    Ubiquitous::ModelHelpers.should_receive(:models).any_number_of_times.and_return([Boat, Car])
    Ubiquitous::ModelHelpers.create_helper_methods
    Object.const_set("Capybara", Class.new)
    Capybara.should_receive(:current_session).and_return(nil)

    class TestClass
      include(Ubiquitous::ModelHelpers)
    end

    TestClass.new.boat.should be_a(BoatModel)
  end



end