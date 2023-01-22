# frozen_string_literal: true

source "https://rubygems.org"

gem "rake", require: false
gem "zeitwerk"
gem "ulid"
gem "sequel"
gem "pg"

group :development do
  gem "rubocop", require: false
end

group :test do
  gem "test-unit", require: false
  gem "simplecov", require: false
end

group :development, :test do
  gem "dotenv"
end
