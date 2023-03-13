# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

user = User.create(code: ULID.generate)
DeveloperUser.create(code: "user@example.com", user:)
projects = 20.times.map { Project.create(code: ULID.generate, name: Faker::Game.title) }
project_members = projects.map { |project| ProjectMember.create(project:, user:, role: "leader") }
project_members.map { |project_member| ActiveProjectMember.create(project_member:) }
