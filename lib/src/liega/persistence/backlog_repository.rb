# frozen_string_literal: true

module Liega
  module Persistence
    class BacklogRepository < Repository
      self.active_record = Backlog

      def find(code)
        create_instance(Backlog.find_by!(code:))
      end

      def find_by_project(project_code)
        project_id = Project.find_by!(code: project_code).id
        create_instance(Backlog.find_by!(project_id:))
      end

      def save(backlog, lock_version = nil)
        project_id = Project.find_by!(code: backlog.project_code).id
        save_relation(backlog, { **backlog.to_h.except(:project_code), project_id: }, lock_version)
      end

      private

      def create_instance(model)
        attributes = aggregate_root_attributes(model)
        Domain::Model::Backlog.new(**attributes.except(:id, :project_id), project_code: model.project.code)
      end
    end
  end
end
