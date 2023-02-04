# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectMemberRepository
      def find(id)
        attributes = ProjectMember.find(id).attributes.symbolize_keys
        Domain::Model::ProjectMember.new(**attributes)
      end

      def save(project_member)
        ProjectMember.upsert(project_member.to_h)
      end
    end
  end
end
