class SubIssue < ApplicationRecord
  validates :title, presence: true

  belongs_to :main_issue
  has_many :informations
end
