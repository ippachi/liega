# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectMemberRepository
      def find_by_project_and_user(project_id, user_id)
        attributes = ProjectMember.active.find_by!(project_id:, user_id:).attributes.symbolize_keys
        Domain::Model::ProjectMember.new(**attributes)
      end

      def save(project_member)
        project_member_id = ProjectMember.upsert(project_member.to_h, unique_by: %i[user_id project_id]).first["id"]
        if project_member.actived?
          ActiveProjectMember.upsert({ project_member_id: }, unique_by: :project_member_id)
        else
          ActiveProjectMember.where(project_member_id:).delete
        end
      end
    end
  end
end
