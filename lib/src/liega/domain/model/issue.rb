# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Issue
        attr_reader :id, :backlog_id
        private attr_reader :summary

        def initialize(backlog_id:, summary:, id: ULID.generate)
          @id = id
          @backlog_id = backlog_id
          @summary = summary
          validate
        end

        def to_h = { id:, backlog_id: }

        private

        def validate
          raise ValidationError, to_h if summary.empty?
        end
      end
    end
  end
end
