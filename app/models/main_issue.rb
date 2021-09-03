class MainIssue < ApplicationRecord

  validates :title, presence: true

  belongs_to :user
  has_many :sub_issues
  has_one :conclusions
  
end
