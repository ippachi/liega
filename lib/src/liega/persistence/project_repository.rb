# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectRepository
      def find(id)
        attributes = Project.find(id).attributes.symbolize_keys
        Domain::Model::Project.new(**attributes)
      end

      def save(project)
        Project.upsert(project.to_h)
      end
    end
  end
end
