# frozen_string_literal: true

module Liega
  module Persistence
    class IssueRepository < Repository
      self.active_record = Issue

      def find(id)
        attributes = aggregate_root_attributes(Issue.find(id))
        Domain::Model::Issue.new(**attributes)
      end

      def save(issue, lock_version = nil)
        super { Issue.upsert(issue.to_h) }
      end
    end
  end
end
