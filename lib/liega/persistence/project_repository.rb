# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectRepository < Repository
      relation_name :projects

      def save(project)
        DB.transaction do
          DB[:projects].insert_conflict.insert(project.to_h.slice(:id, :name))
          delete_active_project_members(project)
          insert_active_project_members(project)
        end
      end

      private

      def delete_active_project_members(project)
        DB[:active_project_members].from(:active_project_members, :project_members).where(
          Sequel[:active_project_members][:project_member_id] => Sequel[:project_members][:id],
          Sequel[:project_members][:project_id] => project.id
        ).delete
      end

      def insert_active_project_members(project)
        project.members.each do |member|
          project_member_id = DB[:project_members].insert_conflict.insert(**member.to_h, project_id: project.id)
          DB[:active_project_members].insert(project_member_id:)
        end
      end
    end
  end
end
