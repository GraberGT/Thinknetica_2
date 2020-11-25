class User < ApplicationRecord
  has_many :test_histories
  has_and_belongs_to_many :tests, through: :test_histories
  has_many :created_tests, class_name: "Test", foreign_key: "author_id"

  def passed_tests_by_level(level)
    Test.joins(:test)
      .where(level: level, test_histories: { user_id: self.id })
      .distinct
  end
end
