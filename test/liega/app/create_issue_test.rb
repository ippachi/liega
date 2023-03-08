# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class CreateIssueTest < ActiveSupport::TestCase
      setup do
        @sut = CreateIssue.new
      end

      test "create issue" do
        author_id = users(:normal).id
        backlog_code = backlogs(:default).code
        issue = @sut.call(author_id, backlog_code, "summary")
        assert issue_repo.find(issue.code)
      end
    end
  end
end
