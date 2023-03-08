# frozen_string_literal: true

module Liega
  module Persistence
    class IssueRepository < Repository
      self.active_record = Issue

      def find(code)
        attributes = aggregate_root_attributes(Issue.find_by!(code:))
        Domain::Model::Issue.new(**attributes.except(:id))
      end

      def save(issue, lock_version = nil)
        super { Issue.upsert(issue.to_h) }
      end
    end
  end
end
