require "simplecov"
SimpleCov.start

require "dotenv"
Dotenv.load(".env.test")

require "liega"
require "test/unit"

require_relative "support/application_test_case"
