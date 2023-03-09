# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class StarredProject < Entity
        attr_reader :code
        private attr_reader :user_code, :project_code

        def initialize(user_code:, project_code:, code: ULID.generate)
          super()
          @user_code = user_code
          @project_code = project_code
          @code = code
        end

        def serialize = { user_code:, project_code:, code: }
      end
    end
  end
end
