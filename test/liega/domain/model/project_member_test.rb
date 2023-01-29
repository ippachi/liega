# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectMemberTest < ActiveSupport::TestCase
        {
          "with empty user_id": { user_id: "", role: :leader },
          "with invalid role": { user_id: "user_id", role: :hoge }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              ProjectMember.new(**data)
            end
          end
        end
      end
    end
  end
end
