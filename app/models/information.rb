class Information < ApplicationRecord
  validates :content, presence: true

  belongs_to :sub_issue
end
