# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project
        attr_reader :id, :members
        private attr_reader :name

        def self.create(name:, members:) = new(name:, members: members.map { ProjectMember.new(**_1) })

        def initialize(name:, members:, id: ULID.generate)
          @id = id
          @name = name
          @members = members
          validate
        end

        def to_h = { id:, name:, members: members.map(&:to_h) }

        private

        def validate
          raise ValidationError, to_h if id.to_s.empty? || name.to_s.empty? || !at_least_one_leader?
        end

        def at_least_one_leader? = members.any?(&:leader?)
      end
    end
  end
end
