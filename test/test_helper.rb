# frozen_string_literal: true

require "simplecov"
SimpleCov.start

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "active_job"
require "minitest/mock"

module ActiveSupport
  class TestCase
    include ActiveJob::TestHelper
    include FactoryBot::Syntax::Methods
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    private

    def project_repo = Liega::Persistence::ProjectRepository.new
    def backlog_repo = Liega::Persistence::BacklogRepository.new
    def issue_repo = Liega::Persistence::IssueRepository.new
    def starred_project_repo = Liega::Persistence::StarredProjectRepository.new
  end

  class ControllerTestCase < ActionDispatch::IntegrationTest
    setup do
      OmniAuth.config.test_mode = true
    end

    teardown do
      OmniAuth.config.test_mode = false
    end

    private

    def login
      OmniAuth.config.mock_auth[:developer] = OmniAuth::AuthHash.new(
        provider: "developer",
        uid: developer_users(:normal).code
      )
      post "/auth/developer"
      follow_redirect!
    end
  end
end
