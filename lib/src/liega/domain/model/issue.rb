# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Issue < Entity
        attr_reader :id, :backlog_id
        private attr_reader :summary

        def initialize(backlog_id:, summary:, id: ULID.generate)
          super()
          @id = id
          @backlog_id = backlog_id
          @summary = summary
          validate
        end

        def to_h = { id:, backlog_id:, summary: }

        private

        def validate
          should_present(:summary)
        end
      end
    end
  end
end
