# frozen_string_literal: true

class User < ApplicationRecord
  has_many :project_members, -> { active }, dependent: :restrict_with_exception, inverse_of: :user
  has_many :projects, through: :project_members

  has_many :starred_projects, through: :project_members

  has_one :developer_user, dependent: :restrict_with_exception
end
