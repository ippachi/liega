# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class ProjectTest < ActiveSupport::TestCase
        {
          "with empty name": { name: "" }
        }.each do |name, data|
          test "validation #{name}" do
            assert_raises ValidationError do
              Project.new(**data)
            end
          end
        end
      end
    end
  end
end
