# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project < Entity
        attr_reader :id
        private attr_reader :name

        def initialize(name:, id: ULID.generate)
          super()
          @id = id
          @name = name
          validate
        end

        def to_h = { id:, name: }
        def add_member(user_id, role) = ProjectMember.new(project_id: id, user_id:, role:)
        def ==(other) = id == other.id
        def create_backlog = Backlog.new(project_id: id)

        private

        def validate
          should_present(:id).should_present(:name).should_length_lteq(:name, 255)
        end
      end
    end
  end
end
