# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project
        attr_reader :id
        private attr_reader :name, :members

        def self.create(name:, members:, id: ULID.generate)
          new(name:, id:, members: members.map { ProjectMember.new(**_1) })
        end

        def initialize(name:, members:, id:)
          @id = id
          @name = name
          @members = members
          validate
        end

        def to_h = { id:, name: }
        def leader_id = members.find(&:leader?).user_id

        private

        def validate
          raise ValidationError, to_h if id.to_s.empty? || name.to_s.empty? || members.none?(&:leader?)
        end
      end
    end
  end
end
