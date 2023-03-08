# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Issue < Entity
        attr_reader :code, :backlog_id
        private attr_reader :summary

        def initialize(backlog_id:, summary:, code: ULID.generate)
          super()
          @code = code
          @backlog_id = backlog_id
          @summary = summary
          validate
        end

        def to_h = { code:, backlog_id:, summary: }

        private

        def validate
          should_present(:summary)
        end
      end
    end
  end
end
