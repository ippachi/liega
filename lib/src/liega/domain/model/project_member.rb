# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMember < Entity
        attr_reader :id, :user_id, :project_id
        private attr_reader :role, :active_status

        def initialize(project_id:, user_id:, role:, active_status: true, id: ULID.generate)
          super()
          @id = id
          @project_id = project_id
          @user_id = user_id
          @role = role.to_sym
          @active_status = active_status
          validate
        end

        def to_h = { id:, project_id:, user_id:, role: }
        def leader? = role == :leader
        def actived? = active_status

        private

        def validate
          should_present(:user_id).should_include(:role, %i[normal leader])
        end
      end
    end
  end
end
