# frozen_string_literal: true

module Liega
  module Persistence
    class IssueRepository
      def find(id)
        attributes = Issue.find(id).attributes.symbolize_keys
        Domain::Model::Issue.new(**attributes)
      end

      def save(issue)
        Issue.upsert(issue.to_h)
        issue
      end
    end
  end
end
