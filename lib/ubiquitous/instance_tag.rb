# Copyright 2012 ThoughtWorks, Inc. Licensed under the MIT License

module ActionView
  module Helpers

    class InstanceTag

      def tag_id
        "#{sanitized_object_name}_0_#{sanitized_method_name}"
      end

      # No alteration, just making it public

      def tag_id_with_index(index)
        "#{sanitized_object_name}_#{index}_#{sanitized_method_name}"
      end

    end

  end
end

