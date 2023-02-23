# frozen_string_literal: true

class User < ApplicationRecord
  has_many :project_members, -> { active }, dependent: :restrict_with_exception, inverse_of: :user
  has_many :projects, through: :project_members
end
