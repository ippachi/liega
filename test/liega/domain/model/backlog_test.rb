# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class BacklogTest < ActiveSupport::TestCase
        test "validation with nil project_code" do
          assert_raises ValidationError do
            Backlog.new(project_code: nil)
          end
        end

        test "create issue" do
          backlog = Backlog.new(project_code: "test")
          issue = backlog.create_issue(summary: "test")
          assert_equal backlog.code, issue.backlog_code
        end
      end
    end
  end
end
