class Test < ApplicationRecord
  TIME_TO_PASS = [0, 5, 10, 15]

  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :questions, dependent: :destroy
  has_many :test_passages
  has_many :users, through: :test_passages

  validates :title, :level, presence: true
  validates :title, uniqueness:   { scope: :level }
  validates :level, numericality: { only_integer: true, :greater_than_or_equal_to => 0 }
  validates :time_to_pass, presence: true, 
                    numericality: { only_integer: true },
                    inclusion:    { in: TIME_TO_PASS }

  scope :passed, ->(user_id) { joins(:test_passages).
    where('test_passages.passed = ? AND test_passages.user_id = ?', true, user_id) }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..10) }
  scope :published, -> { where(complete: true) }
  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }) }

  def self.titles_by_category(category)
    Test.by_category(category).order(title: :desc).pluck(:title)
  end
  
  def completed
    if self.complete
      I18n.t('helpers.yeap')
    else
      I18n.t('helpers.nope')
    end
  end
end
