# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project < Entity
        attr_reader :code
        private attr_reader :name, :members

        def self.create(name:, members:, code: ULID.generate)
          new(name:, members: ProjectMembers.create(members:, project_code: code), code:)
        end

        def initialize(name:, members:, code:)
          super()
          @code = code
          @name = name
          @members = members
          validate
        end

        def serialize = { code:, name:, members: members.serialize }
        def ==(other) = code == other.code
        def create_backlog = Backlog.new(project_code: code)
        def add_member(...) = members.add(...)
        def remove_member(...) = members.remove(...)

        private

        def validate
          should_present(:code).should_present(:name).should_length_lteq(:name, 255)
        end
      end
    end
  end
end
