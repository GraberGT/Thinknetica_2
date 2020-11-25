class Test < ApplicationRecord
belongs_to :category
belongs_to :author, class_name: "User", optional: true
has_many :questions
has_many :test_histories
has_and_belongs_to_many :users


  def self.titles(category)
    joins(:category)
      .where(categories: { category: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
