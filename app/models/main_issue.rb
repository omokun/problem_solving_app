class MainIssue < ApplicationRecord

  validates :title, presence: true

  has_many :sub_issues
  belongs_to :user
  
end
