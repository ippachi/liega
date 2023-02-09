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
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def project_repo = Liega::Persistence::ProjectRepository.new
    def project_member_repo = Liega::Persistence::ProjectMemberRepository.new
    def backlog_repo = Liega::Persistence::BacklogRepository.new
  end
end
