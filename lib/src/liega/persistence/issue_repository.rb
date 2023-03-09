# frozen_string_literal: true

module Liega
  module Persistence
    class IssueRepository < Repository
      self.active_record = Issue

      def find(code)
        issue = Issue.find_by!(code:)
        attributes = aggregate_root_attributes(issue).except(:backlog_id)
        Domain::Model::Issue.new(**attributes, backlog_code: issue.backlog.code)
      end

      def save(issue, lock_version = nil)
        backlog_id = Backlog.find_by!(code: issue.backlog_code).id
        save_relation(issue, { **issue.serialize.except(:backlog_code), backlog_id: }, lock_version)
      end
    end
  end
end
