# frozen_string_literal: true

module Liega
  module Persistence
    class BacklogRepository
      def find(id)
        create_instance(Backlog.find(id))
      end

      def find_by_project(project_id)
        create_instance(Backlog.find_by!(project_id:))
      end

      def save(backlog)
        Backlog.upsert(backlog.to_h, unique_by: :project_id)
        backlog
      end

      private

      def create_instance(model)
        attributes = model.attributes.symbolize_keys
        Domain::Model::Backlog.new(**attributes)
      end
    end
  end
end
