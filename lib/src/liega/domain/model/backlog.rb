# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Backlog < Entity
        attr_reader :code, :project_code

        def initialize(project_code:, code: ULID.generate)
          super()
          @code = code
          @project_code = project_code
          validate
        end

        def serialize = { code:, project_code: }
        def create_issue(summary:) = Issue.new(backlog_code: code, summary:)

        private

        def validate
          should_present(:project_code)
        end
      end
    end
  end
end
