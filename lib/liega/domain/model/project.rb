# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project
        attr_reader :id, :members
        private attr_reader :name

        def self.create(name:, members:)
          new(name:, members: members.map { ProjectMember.new(**_1) })
        end

        def initialize(name:, members:)
          @id = ULID.generate
          @name = name
          @members = members
        end

        def to_h = { id:, name:, members: members.map(&:to_h) }
      end
    end
  end
end
