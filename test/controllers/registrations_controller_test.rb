# frozen_string_literal: true

require "test_helper"

class RegistrationsControllerTest < ActiveSupport::ControllerTestCase
  setup do
    OmniAuth.config.mock_auth[:developer] = OmniAuth::AuthHash.new(
      provider: "developer",
      uid: developer_users(:normal).id
    )
  end

  test "redirect projects when authenticated" do
    post "/auth/developer"
    follow_redirect!
    get new_registrations_path
    assert_redirected_to projects_path
  end
end
