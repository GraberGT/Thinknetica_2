class Test < ApplicationRecord
belongs_to :category
has_many :questions
has_and_belongs_to_many :users

  def self.titles(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
