class Information < ApplicationRecord
  validates :content, presence: true

  belongs_to :hypothesis
end
