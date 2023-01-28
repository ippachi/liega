# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMember
        private attr_reader :user_id, :role

        def initialize(user_id:, role:)
          @user_id = user_id
          @role = role
        end

        def to_h
          { user_id:, role: role.to_s }
        end
      end
    end
  end
end
