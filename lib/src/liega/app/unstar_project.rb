module Liega
  module App
    class UnstarProject < Interactor
      def initialize(starred_project_repo: Persistence::StarredProjectRepository.new)
        super()
        @starred_project_repo = starred_project_repo
      end

      def call(user_code, project_code)
        starred_project = @starred_project_repo.find_by_user_and_project(user_code, project_code)
        starred_project.destroy
        @starred_project_repo.save(starred_project)
      end
    end
  end
end
