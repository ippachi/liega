# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class CreateIssueTest < ActiveSupport::TestCase
      setup do
        @sut = CreateIssue.new
      end

      test "create issue" do
        author_code = users(:normal).code
        backlog_code = backlogs(:default).code
        issue = @sut.call(author_code, backlog_code, "summary")
        assert issue_repo.find(issue.code)
      end
    end
  end
end
