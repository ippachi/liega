# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Issue < Entity
        attr_reader :code, :backlog_code
        private attr_reader :summary

        def initialize(backlog_code:, summary:, code: ULID.generate)
          super()
          @code = code
          @backlog_code = backlog_code
          @summary = summary
          validate
        end

        def serialize = { code:, backlog_code:, summary: }

        private

        def validate
          should_present(:summary)
        end
      end
    end
  end
end
