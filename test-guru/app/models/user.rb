class User < ApplicationRecord
  has_and_belongs_to_many :tests, through: :test_histories
  has_many :created_tests, class_name: "Test", foreign_key: "author_id",
  dependent: :nullify

  validates :name, :email, presence: true

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
