# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Entity
        protected

        def should_present(name)
          raise ValidationError, serialize if instance_variable_get(:"@#{name}").to_s.empty?

          self
        end

        def should_length_lteq(name, max)
          raise ValidationError, serialize if instance_variable_get(:"@#{name}").length > max

          self
        end
      end
    end
  end
end
