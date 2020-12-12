class Category < ApplicationRecord
  has_many :tests
  validates :category, presence: true

  default_scope { order(:category) }
end
