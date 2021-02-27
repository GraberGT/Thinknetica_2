class GistQuestionService
  
  def initialize(question, client:)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
    @client.last_response
  end

  def save_gist(user)
    gist = @question.gists.new(gist_url: @client.last_response.data.id, user_id: user.id)

    if gist.save 
      { notice: I18n.t('gist_question_service.success', url: @client.last_response.data.html_url) }
    else
      { alert: I18n.t('gist_question_service.not_saved') }
    end
  end

  private

  def gist_params
    { 
      description: I18n.t('gist_question_service.description', test_title: @test.title),,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end
  
  def gist_content
    [
      @question.title,
      @question.answers.pluck(:title)
    ].join("\n")
  end
  
end