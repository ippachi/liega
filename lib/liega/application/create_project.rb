# frozen_string_literal: true

module Liega
  module Application
    class CreateProject
      def initialize(project_repo: Liega::Persistence::ProjectRepository.new)
        @project_repo = project_repo
      end

      def call(author, name)
        author.create_project(name:).tap { |project| @project_repo.save(project) }
      end
    end
  end
end
