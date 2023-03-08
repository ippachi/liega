# frozen_string_literal: true

module Liega
  module Persistence
    class IssueRepository < Repository
      self.active_record = Issue

      def find(code)
        attributes = aggregate_root_attributes(Issue.find_by!(code:))
        backlog_code = Backlog.find(attributes.delete(:backlog_id)).code
        Domain::Model::Issue.new(**attributes.except(:id), backlog_code:)
      end

      def save(issue, lock_version = nil)
        relation = Issue.find_or_initialize_by(code: issue.code)
        backlog_id = Backlog.find_by!(code: issue.backlog_code).id
        relation.assign_attributes(**issue.to_h.except(:backlog_code), backlog_id:, lock_version:)
        relation.save!
      end
    end
  end
end
