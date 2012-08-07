# Copyright 2012 ThoughtWorks, Inc. Licensed under the MIT License

module ActionView
  module Helpers

    class InstanceTag

      def tag_id
        "#{sanitized_object_name}_0_#{sanitized_method_name}"
      end

      public :tag_id_with_index

    end

  end
end

