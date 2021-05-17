class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[show update result gist]
  
  
  def show
    if @test_passage.test.questions.blank?
      redirect_to root_path, alert: t('.invalid_questions')
    end

    if @test_passage.current_question.answers.blank?
      redirect_to root_path, alert: t('.invalid_answers')
    end
  end

  def result
    if @test_passage.user_id == current_user.id
      @rate = @test_passage.rate
    else
      redirect_to root_path
    end
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question)
    result.call
    if result.success?
      current_user.gists.create(question_id: @test_passage.current_question.id, url: result.url)
      redirect_to @test_passage, notice: t('.success', url: result.url)
    else
      redirect_to @test_passage, alert: t('.failure')
    end

  end

  private
  
  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
