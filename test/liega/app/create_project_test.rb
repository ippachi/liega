# frozen_string_literal: true

require "test_helper"

module Liega
  module App
    class CreateProjectTest < ActiveSupport::TestCase
      def test_create_project
        project = CreateProject.new.call(users(:independent).id, "project_name")
        assert Persistence::ProjectRepository.new.find(project.id)
      end
    end
  end
end
