# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class IssueTest < ActiveSupport::TestCase
        test "validation with empty summary" do
          assert_raises ValidationError do
            Issue.new(summary: "", backlog_id: "test")
          end
        end
      end
    end
  end
end
