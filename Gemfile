# frozen_string_literal: true

source "https://rubygems.org"

gem "pg"
gem "rake", require: false
gem "sequel"
gem "ulid"
gem "zeitwerk"

group :development do
  gem "rubocop", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-sequel", require: false
end

group :test do
  gem "simplecov", require: false
  gem "test-unit", require: false
end

group :development, :test do
  gem "dotenv"
end
