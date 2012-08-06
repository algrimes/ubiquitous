module Ubiquitous
  class BaseModel

    def initialize(session, index=0)
      @session = session
      @normalised_model_name = self.class.name.gsub "Model", ""
      models = Dir['app/models/**/*.rb'].map { |f| File.basename(f, '.*').camelize.constantize }
      @model = models.select { |m| @normalised_model_name == m.to_s }.first.new
      @index = index
    end

    def method_missing(method_name, *args, &block)
      @method_name = method_name
      assert_presence_of_method_on_model(@method_name)
      @session.find(:id, element_namespace)
    end

    private

    def assert_presence_of_method_on_model(method_name)
      unless @model.public_methods.include? method_name
        raise NoMethodError, "this method, \"#{method_name}\" doesn't exist on the #{@model.class.name} model"
      end
    end

    def element_namespace
      require 'action_view/helpers/form_helper'
      ActionView::Helpers::InstanceTag.new(@normalised_model_name.downcase, @method_name, nil, nil).tag_id_with_index(@index)
    end

  end
end