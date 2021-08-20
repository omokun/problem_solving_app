class SubIssue < ApplicationRecord

  validates :title, presence: true

  has_many :informations
  belongs_to :main_issue

end
