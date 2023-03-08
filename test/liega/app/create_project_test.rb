# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class CreateProjectTest < ActiveSupport::TestCase
      setup do
        @sut = CreateProject.new
        @user_code = users(:independent).code
      end

      test "create project" do
        project = @sut.call(@user_code, "project_name")

        assert project_repo.find(project.code)
        assert backlog_repo.find_by_project(project.code)
      end
    end
  end
end
