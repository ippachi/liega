# frozen_string_literal: true

module Liega
  module Persistence
    class BacklogRepository < Repository
      self.active_record = Backlog

      def find(id)
        create_instance(Backlog.find(id))
      end

      def find_by_project(project_id)
        create_instance(Backlog.find_by!(project_id:))
      end

      def save(backlog, lock_version = nil)
        super { Backlog.upsert(backlog.to_h, unique_by: :project_id) }
      end

      private

      def create_instance(model)
        attributes = aggregate_root_attributes(model)
        Domain::Model::Backlog.new(**attributes)
      end
    end
  end
end
