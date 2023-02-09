# frozen_string_literal: true

module Liega
  module Persistence
    class BacklogRepository
      def find_by_project(project_id)
        attributes = Backlog.find_by!(project_id:).attributes.symbolize_keys
        Domain::Model::Backlog.new(**attributes)
      end

      def save(backlog)
        Backlog.upsert(backlog.to_h, unique_by: :project_id)
        backlog
      end
    end
  end
end
