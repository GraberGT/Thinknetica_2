class Test < ApplicationRecord
belongs_to :category
belongs_to :author, class_name: "User", optional: true
has_many :questions
has_and_belongs_to_many :users

validates :title, presence: true, 
uniqueness: { scope: :level, message: "should be one level for title" }
validates :level, numericality: { greater_than_or_equal_to: 0}

scope :easy, -> { where(level: 0..1) }
scope :medium, -> { where(level: 2..4) }
scope :hard, -> { where(level: 5..Float::INFINITY) }
scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.titles_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
end
