require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

namespace :db do
  task :environment do
    require "dotenv"
    Dotenv.load(".env.#{ENV.fetch("APP_ENV", "development")}")
  end

  desc "Run migrations"
  task :migrate, [:version] => :environment do |t, args|
    require "sequel/core"
    Sequel.extension :migration
    version = args[:version].to_i if args[:version]
    Sequel.connect(ENV.fetch("DATABASE_URL")) do |db|
      Sequel::Migrator.run(db, "db/migrations", target: version)
    end
  end
end

task :default => :test
