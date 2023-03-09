# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMember
        attr_reader :user_code
        private attr_reader :project_code, :role

        def initialize(user_code:, project_code:, role:)
          @user_code = user_code
          @project_code = project_code
          @role = role
        end

        def serialize = { user_code:, project_code:, role: }
        def leader? = @role.to_s == "leader"
        def star_project = StarredProject.new(user_code:, project_code:)
      end
    end
  end
end
