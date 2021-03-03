class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test_passage, only: %i[create send_gist]

  def create
    if send_gist
      new_gist
    else
      flash[:error] = t('gist_question_service.failure')
    end

    redirect_to @test_passage
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

  def new_gist
    test_passage = TestPassage.find(gist_params[:id])
    question = test_passage.current_question
    new_gist = GistQuestionService.new(question, current_user).create_gist
    new_gist&.save
    flash_options = if new_gist
                      { notice: t('gist_question_service.success', link: gist_link(new_gist)) }
                    else
                      { alert: t('gist_question_service.not_saved') }
                    end
    redirect_to test_passage, flash_options
  end

  def send_gist
    @question = @test_passage.current_question
    @result = GistQuestionService.new(@question).call
  end
end

def new_gist
  if @gist.last_response
    flash[:notice] = t('gist_question_service.success', url: @result.data.html_url)
  else 
    flash[:alert] = t('gist_question_service.not_saved')
  end
end
