class Test < ApplicationRecord
belongs_to :category
belongs_to :author, class_name: "User", optional: true
has_many :questions
has_and_belongs_to_many :users
#teststets

  def self.titles(category)
    joins("JOIN categories ON tests.category_id = categories.id")
      .where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
