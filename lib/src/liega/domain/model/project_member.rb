# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMember
        attr_reader :user_id
        private attr_reader :role

        def initialize(user_id:, role:, id: ULID.generate)
          @id = id
          @user_id = user_id
          @role = role
          validate
        end

        def to_h = { user_id:, role: }
        def leader? = role == :leader

        private

        def validate
          raise ValidationError, to_h if user_id.to_s.empty? || %i[normal leader].exclude?(role)
        end
      end
    end
  end
end
