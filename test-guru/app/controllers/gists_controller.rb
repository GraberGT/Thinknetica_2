class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[create send_gist]

  def create
    if send_gist
      save_gist
    else
      flash[:error] = t('gist_question_service.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def send_gist
    @question = @test_passage.current_question
    @result = GistQuestionService.new(@question).call
  end
end