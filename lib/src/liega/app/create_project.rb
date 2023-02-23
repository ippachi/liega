# frozen_string_literal: true

module Liega
  module App
    class CreateProject < Interactor
      def initialize(user_repo: Persistence::UserRepository.new,
                     project_repo: Persistence::ProjectRepository.new,
                     project_member_repo: Persistence::ProjectMemberRepository.new,
                     backlog_repo: Persistence::BacklogRepository.new)
        super()
        @user_repo = user_repo
        @project_repo = project_repo
        @project_member_repo = project_member_repo
        @backlog_repo = backlog_repo
      end

      def call(author_id, project_name)
        transaction do
          author = @user_repo.find(author_id)
          project = author.create_project(name: project_name)
          project_member = project.add_member(author.id, :leader)
          backlog = project.create_backlog

          transaction { save_resources(project, project_member, backlog) }
          project
        end
      end

      private

      def save_resources(project, project_member, backlog)
        @project_repo.save(project)
        @project_member_repo.save(project_member)
        @backlog_repo.save(backlog)
      end
    end
  end
end
