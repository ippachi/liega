# frozen_string_literal: true

module Liega
  module App
    class CreateProject < Interactor
      def initialize(user_repo: Persistence::UserRepository.new,
                     project_repo: Persistence::ProjectRepository.new,
                     project_member_repo: Persistence::ProjectMemberRepository.new)
        super()
        @user_repo = user_repo
        @project_repo = project_repo
        @project_member_repo = project_member_repo
      end

      def call(author_id, project_name)
        author = @user_repo.find(author_id)
        project = create_project(author, project_name)
        add_member(project, author)
        project
      end

      def project_created(project:, author_id:)
        author = @user_repo.find(author_id)
        add_member(project, author)
      end

      private

      def create_project(author, project_name)
        transaction do
          project = author.create_project(name: project_name)
          @project_repo.save(project)
        end
      end

      def add_member(project, user)
        transaction do
          project_member = project.add_member(user.id, :leader)
          @project_member_repo.save(project_member)
        end
      end
    end
  end
end
