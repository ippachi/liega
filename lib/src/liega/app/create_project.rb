# frozen_string_literal: true

module Liega
  module App
    class CreateProject
      def initialize(user_repo: Persistence::UserRepository.new, project_repo: Persistence::ProjectRepository.new)
        @user_repo = user_repo
        @project_repo = project_repo
      end

      def call(user_id, project_name)
        user = @user_repo.find(user_id)
        project = user.create_project(name: project_name)
        @project_repo.save(project)
        project
      end
    end
  end
end
