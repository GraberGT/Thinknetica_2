class Question < ApplicationRecord
  belongs_to :test, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :title, presence: true
end
