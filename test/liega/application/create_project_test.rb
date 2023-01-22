require "test_helper"

module Liega::Application
  class CreateProjectTest < ApplicationTestCase
    def test_create_project
      author = Liega::Domain::Model::User.new
      Liega::Persistence::UserRepository.new.save(author)
      project = CreateProject.new.call(author, "Test project name")
      assert Liega::Persistence::ProjectRepository.new.find(project.id)
    end
  end
end
