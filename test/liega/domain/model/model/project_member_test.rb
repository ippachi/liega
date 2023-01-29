# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectMemberTest < Test::Unit::TestCase
        data("with nil user_id", { user_id: nil, role: "leader" })
        data("with invalid role", { user_id: "test", role: "invalid" })
        def test_validation(data)
          assert_raise ValidationError do
            ProjectMember.new(**data)
          end
        end
      end
    end
  end
end
