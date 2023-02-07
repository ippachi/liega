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

        def create_project(name:)
          project = Project.new(name:)
          ProjectCreated.publish(project:, author_id: id)
          project
        end

        private

        def validate
          raise ValidationError, to_h if id.to_s.empty?
        end
      end
    end
  end
end
