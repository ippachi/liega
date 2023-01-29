# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < Test::Unit::TestCase
        data("with empty name", { name: "", members: [{ user_id: "test", role: "leader" }] })
        data("with zero leader", { name: "name", members: [{ user_id: "test", role: "normal" }] })
        def test_validation
          assert_raise ValidationError do
            Project.create(name: "", members: [{ user_id: "test", role: "leader" }])
          end
        end
      end
    end
  end
end
