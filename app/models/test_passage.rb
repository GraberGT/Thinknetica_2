class TestPassage < ApplicationRecord
  PASS_RATE = 85

  belongs_to :user, dependent: :destroy
  belongs_to :test, dependent: :destroy
  belongs_to :current_question, class_name: "Question", optional: true, dependent: :destroy

  before_validation :before_validate_set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def question_index
    test.questions.ids.sort.index(current_question.id) + 1
  end

  def rate
    correct_questions / test.questions.count.to_f * 100
  end

  def is_passed?
    rate >= PASS_RATE
  end

  def failed?
    !passed?
  end

  def finished!
    update(finished: true)
  end

  def time_left
    (end_time - Time.current).to_i
  end

  def in_time?
    test.time_to_pass.zero? || time_left >= 0
  end

  private

  def remaining
    if self.current_question.nil?
      test.questions.order(:id)
    else
      test.questions.order(:id).where('id > ?', current_question.id)
    end
  end

  def before_validate_set_current_question
    self.current_question = remaining.first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def end_time
    created_at + test.time_to_pass * 60
  end
end
