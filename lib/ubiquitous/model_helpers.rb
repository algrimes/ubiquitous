module Ubiquitous

  module ModelHelpers

    models = Dir['app/models/**/*.rb'].map { |f| File.basename(f, '.*').camelize.constantize }

    models.each do |model|
      class_name = "#{model}Model"
      Object.const_set(class_name, Class.new(BaseModel))
    end

  models.each do |model|
    method_name = (model.to_s.downcase).to_sym
    send :define_method, method_name do |index=0|
      "#{model}Model".constantize.new(Capybara.current_session, index)
    end
  end

  end
end