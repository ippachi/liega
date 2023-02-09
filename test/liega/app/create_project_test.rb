# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class CreateProjectTest < ActiveSupport::TestCase
      setup do
        @sut = CreateProject.new
        @user_id = users(:independent).id
      end

      test "create project" do
        project = @sut.call(@user_id, "project_name")
        assert_project_and_project_member_and_backlog_created(project)
        perform_enqueued_jobs
      end

      test "create project member with error before create member" do
        project = @sut.stub(:add_member, nil) { @sut.call(@user_id, "project name") }
        perform_enqueued_jobs
        assert_project_and_project_member_and_backlog_created(project)
      end

      def assert_project_and_project_member_and_backlog_created(project)
        assert project_repo.find(project.id)
        assert project_member_repo.find_by_project_and_user(project.id, @user_id)
        assert backlog_repo.find_by_project(project.id)
      end
    end
  end
end
