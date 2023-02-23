# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class User < Entity
        attr_reader :id

        def initialize(id: ULID.generate)
          super()
          @id = id
          validate
        end

        def to_h = { id: }
        def create_project(name:) = Project.new(name:, members: [{ user_id: id, role: "leader" }])

        private

        def validate
          should_present(:id)
        end
      end
    end
  end
end
