class User < ApplicationRecord
  # :lockable, :timeoutable, :omniauthables
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable
  
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: "author_id",
  dependent: :nullify

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, 
    message: 'Is not valid' }

  def passed_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
