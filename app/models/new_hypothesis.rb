class NewHypothesis < ApplicationRecord
  validates :content, presence: true

  belongs_to :hypothesis
end