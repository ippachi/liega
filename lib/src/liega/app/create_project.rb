# frozen_string_literal: true

module Liega
  module App
    class CreateProject < Interactor
      def initialize(user_repo: Persistence::UserRepository.new,
                     project_repo: Persistence::ProjectRepository.new,
                     backlog_repo: Persistence::BacklogRepository.new)
        super()
        @user_repo = user_repo
        @project_repo = project_repo
        @backlog_repo = backlog_repo
      end

      def call(author_code, project_name)
        transaction do
          author = @user_repo.find(author_code)
          project = author.create_project(name: project_name)
          backlog = project.create_backlog

          transaction { save_resources(project, backlog) }
          project
        end
      end

      private

      def save_resources(project, backlog)
        @project_repo.save(project)
        @backlog_repo.save(backlog)
      end
    end
  end
end
