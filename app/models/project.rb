# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :project_members, -> { active }, dependent: :restrict_with_exception, inverse_of: :project
  has_many :project_members_with_inactive, class_name: "ProjectMember", dependent: :restrict_with_exception,
                                           inverse_of: :project

  has_many :starred_projects, through: :project_members
  has_many :starred_project_members, through: :starred_projects, class_name: "ProjectMember", source: :project_member
  has_many :starred_members, through: :starred_project_members, class_name: "User", source: :user

  has_one :leader, lambda {
                     active.where(role: "leader")
                   }, class_name: "ProjectMember", inverse_of: :project, dependent: :restrict_with_exception
  has_one :backlog, dependent: :restrict_with_exception

end
