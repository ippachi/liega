# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project < Entity
        attr_reader :id
        private attr_reader :name, :members

        def initialize(name:, members:, id: ULID.generate)
          super()
          @id = id
          @name = name
          @members = members
          validate
        end

        def to_h = { id:, name:, members: }
        def ==(other) = id == other.id
        def create_backlog = Backlog.new(project_id: id)

        def add_member(user_id, role)
          members.push(user_id:, role:)
          validate
        end

        def remove_member(user_id)
          members.delete(members.find { _1[:user_id] == user_id })
          validate
        end

        private

        def validate
          should_present(:id).should_present(:name).should_length_lteq(:name, 255)
          raise ValidationError, to_h if members.count { _1[:role] == "leader" } != 1
        end
      end
    end
  end
end
