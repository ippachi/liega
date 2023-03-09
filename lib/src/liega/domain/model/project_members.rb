# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class ProjectMembers
        private attr_reader :members, :project_code

        def self.create(members:, project_code:)
          new(members: members.map { ProjectMember.new(**_1, project_code:) }, project_code:)
        end

        def initialize(members:, project_code:)
          @members = members
          @project_code = project_code
          validate
        end

        def serialize = members.map { _1.serialize.except(:project_code) }

        def add(user_code, role)
          members.push(ProjectMember.new(user_code:, role:, project_code:))
          validate
        end

        def remove(user_code)
          members.delete(find(user_code))
          validate
        end

        def find(user_code) = members.find { _1.user_code == user_code }

        private

        def validate
          raise ValidationError, serialize if members.count(&:leader?) != 1
        end
      end
    end
  end
end
