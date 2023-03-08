# frozen_string_literal: true

module Liega
  module Domain
    module Model
      class Project < Entity
        attr_reader :code
        private attr_reader :name, :members

        def initialize(name:, members:, code: ULID.generate)
          super()
          @code = code
          @name = name
          @members = members
          validate
        end

        def to_h = { code:, name:, members: }
        def ==(other) = code == other.code
        def create_backlog = Backlog.new(project_code: code)

        def add_member(user_code, role)
          members.push(user_code:, role:)
          validate
        end

        def remove_member(user_code)
          members.delete(members.find { _1[:user_code] == user_code })
          validate
        end

        private

        def validate
          should_present(:code).should_present(:name).should_length_lteq(:name, 255)
          raise ValidationError, to_h if members.count { _1[:role] == "leader" } != 1
        end
      end
    end
  end
end
