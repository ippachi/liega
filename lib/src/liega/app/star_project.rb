# frozen_string_literal: true

module Liega
  module App
    class StarProject < Interactor
      def initialize(project_repo: Persistence::ProjectRepository.new,
                     starred_project_repo: Persistence::StarredProjectRepository.new)
        super()
        @project_repo = project_repo
        @starred_project_repo = starred_project_repo
      end

      def call(user_code, project_code)
        project = @project_repo.find(project_code)
        project_member = project.find_member(user_code)
        @starred_project_repo.save(project_member.star_project)
      end
    end
  end
end
