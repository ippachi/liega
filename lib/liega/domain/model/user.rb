# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class User
        attr_reader :id

        def initialize
          @id = ULID.generate
        end

        def create_project(name:) = Project.create(name:, members: [{ user_id: @id, role: :leader }])
        def to_h = { id: }
      end
    end
  end
end
