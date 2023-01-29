# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMember
        private attr_reader :user_id, :role

        def initialize(user_id:, role:)
          @user_id = user_id
          @role = role
          validate
        end

        def leader? = role == "leader"
        def to_h = { user_id:, role: role.to_s }

        private

        def validate
          raise ValidationError, to_h if user_id.to_s.empty? || !%w[role leader].include?(role)
        end
      end
    end
  end
end
