# frozen_string_literal: true

class StarredProject < ApplicationRecord
  belongs_to :project_member
  has_one :project, through: :project_member
  has_one :user, through: :project_member
end
