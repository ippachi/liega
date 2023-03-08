# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Backlog < Entity
        attr_reader :code, :project_id

        def initialize(project_id:, code: ULID.generate)
          super()
          @code = code
          @project_id = project_id
          validate
        end

        def to_h = { code:, project_id: }
        def create_issue(summary:) = Issue.new(backlog_code: code, summary:)

        private

        def validate
          should_present(:project_id)
        end
      end
    end
  end
end
