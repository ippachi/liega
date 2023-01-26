# frozen_string_literal: true

require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

RuboCop::RakeTask.new

namespace :db do
  desc "Load environment variables"
  task :environment do
    require "dotenv"
    Dotenv.load(".env.#{ENV.fetch('APP_ENV', 'development')}")
  end

  desc "Run migrations"
  task :migrate, [:version] => :environment do |_t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV.fetch("DATABASE_URL")) do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end
end

task default: %i[test rubocop]
