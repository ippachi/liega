# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Backlog
        attr_reader :id, :project_id

        def initialize(project_id:, id: ULID.generate)
          @id = id
          @project_id = project_id
          validate
        end

        def to_h = { id:, project_id: }

        private

        def validate
          raise ValidationError, to_h if project_id.to_s.empty?
        end
      end
    end
  end
end
