# frozen_string_literal: true

module Liega
  module App
    class CreateIssue < Interactor
      def initialize(user_repo: Persistence::UserRepository.new,
                     backlog_repo: Persistence::BacklogRepository.new,
                     issue_repo: Persistence::IssueRepository.new)
        super()
        @user_repo = user_repo
        @backlog_repo = backlog_repo
        @issue_repo = issue_repo
      end

      def call(author_id, backlog_id, summary)
        _author = @user_repo.find(author_id)
        backlog = @backlog_repo.find(backlog_id)
        issue = backlog.create_issue(summary:)
        @issue_repo.save(issue)
        issue
      end
    end
  end
end
