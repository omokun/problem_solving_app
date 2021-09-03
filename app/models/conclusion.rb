class Conclusion < ApplicationRecord
  validates :content, presence: true

  belongs_to :main_issue
end
