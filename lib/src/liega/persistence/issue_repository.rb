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
        backlog_id = Backlog.find_by!(code: issue.backlog_code).id
        save_relation(issue, { **issue.to_h.except(:backlog_code), backlog_id: }, lock_version)
      end
    end
  end
end
