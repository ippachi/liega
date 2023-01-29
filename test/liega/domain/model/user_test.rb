# frozen_string_literal: true

require "test_helper"

module Liega
  module Domain
    module Model
      class UserTest < ActiveSupport::TestCase
        test "validation with nil id" do
          assert_raises ValidationError do
            User.new(id: nil)
          end
        end
      end
    end
  end
end
