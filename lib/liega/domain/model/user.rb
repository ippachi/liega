# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class User
        attr_reader :id

        def initialize
          @id = ULID.generate
        end

        def create_project(name:) = Project.new(name:, leader_id: id)
        def to_h = { id: }
      end
    end
  end
end
