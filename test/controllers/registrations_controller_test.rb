# frozen_string_literal: true

require "test_helper"

class RegistrationsControllerTest < ActiveSupport::ControllerTestCase
  test "redirect projects when authenticated" do
    login
    get new_registrations_path
    assert_redirected_to projects_path
  end
end
