class Test < ApplicationRecord
  def self.titles(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
