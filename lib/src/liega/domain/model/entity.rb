# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Entity
        protected

        def should_present(name)
          raise ValidationError, to_h if instance_variable_get(:"@#{name}").to_s.empty?

          self
        end

        def should_length_lteq(name, max)
          raise ValidationError, to_h if instance_variable_get(:"@#{name}").length > max

          self
        end

        def should_include(name, set)
          raise ValidationError, to_h if set.exclude?(instance_variable_get(:"@#{name}"))

          self
        end
      end
    end
  end
end
