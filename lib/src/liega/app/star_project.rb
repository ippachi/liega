# frozen_string_literal: true

module Liega
  module App
    class StarProject < Interactor
      class NotMemberError < Error; end

      def initialize(project_repo: Persistence::ProjectRepository.new,
                     starred_project_repo: Persistence::StarredProjectRepository.new)
        super()
        @project_repo = project_repo
        @starred_project_repo = starred_project_repo
      end

      def call(user_code, project_code)
        starred_project = @starred_project_repo.find_by_user_and_project_or_nil(user_code, project_code)
        return if starred_project

        project = @project_repo.find(project_code)
        project_member = project.find_member(user_code)
        raise NotMemberError unless project_member

        @starred_project_repo.save(project_member.star_project)
      end
    end
  end
end
