# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < ActiveSupport::TestCase
        {
          "with empty name": { name: "", members: [{ user_id: "user_id", role: :leader }] },
          "with zero leader": { name: "name", members: [{ user_id: "user_id", role: :normal }] }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              Project.create(**data)
            end
          end
        end
      end
    end
  end
end
