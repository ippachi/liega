# frozen_string_literal: true

class ProjectMember < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_one :active_project_member, dependent: :restrict_with_exception
  has_one :starred_project, dependent: :restrict_with_exception

  scope :active, -> { where.associated(:active_project_member) }
end
