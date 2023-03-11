# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class UnstarProjectTest < ActiveSupport::TestCase
      test "unstar project" do
        starred_project = create(:starred_project)
        user_code = starred_project.user.code
        project_code = starred_project.project.code
        UnstarProject.new.call(user_code, project_code)
        assert_nil starred_project_repo.find_by_user_and_project_or_nil(user_code, project_code)
      end

      test "unstar not starred project" do
        user = users(:normal)
        project = projects(:default)
        assert_raises ActiveRecord::RecordNotFound do
          UnstarProject.new.call(user.code, project.code)
        end
      end
    end
  end
end
