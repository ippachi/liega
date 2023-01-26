# frozen_string_literal: true

require "test_helper"

module Liega
  module Application
    class CreateProjectTest < ApplicationTestCase
      def test_create_project
        author = Domain::Model::User.new
        Persistence::UserRepository.new.save(author)
        project = CreateProject.new.call(author, "Test project name")
        assert Persistence::ProjectRepository.new.find(project.id)
      end
    end
  end
end
