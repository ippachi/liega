# frozen_string_literal: true

class StarredProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
end
