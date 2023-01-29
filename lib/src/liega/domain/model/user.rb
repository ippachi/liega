# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class User
        attr_reader :id

        def initialize(id: ULID.generate)
          @id = id
          validate
        end

        def to_h = { id: }

        private

        def validate
          raise ValidationError, to_h if id.to_s.empty?
        end
      end
    end
  end
end
