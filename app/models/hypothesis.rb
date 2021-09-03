class Hypothesis < ApplicationRecord

  validates :content, presence: true

  belongs_to :sub_issue
  has_one :new_hypothesis
  has_many :informations

end
