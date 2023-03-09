# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class User < Entity
        attr_reader :code

        def initialize(code: ULID.generate)
          super()
          @code = code
          validate
        end

        def serialize = { code: }
        def create_project(name:) = Project.create(name:, members: [{ user_code: code, role: "leader" }])

        private

        def validate
          should_present(:code)
        end
      end
    end
  end
end
