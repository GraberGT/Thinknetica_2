class User < ApplicationRecord

  has_and_belongs_to_many :tests

  def passed_tests_by_level(level)
    Test.joins("JOIN test_histories ON test_histories.test_id = tests.id")
      .where(level: level, test_histories: { user_id: self.id })
      .distinct
  end
end
