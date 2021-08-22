class MainIssue < ApplicationRecord

  validates :title, presence: true

  has_many :user_main_issues
  has_many :user, through: :user_main_issues
  has_many :sub_issues
  has_one :conclusions
  
end
