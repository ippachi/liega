# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project
        attr_reader :id
        private attr_reader :name

        def initialize(name:, id: ULID.generate)
          @id = id
          @name = name
          validate
        end

        def to_h = { id:, name: }

        private

        def validate
          raise ValidationError, to_h if id.to_s.empty? || name.to_s.empty?
        end
      end
    end
  end
end
