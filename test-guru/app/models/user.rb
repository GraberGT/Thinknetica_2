class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :create_tests

  def passed_tests_by_level(level)
    tests.where(level: level)
  end
end
