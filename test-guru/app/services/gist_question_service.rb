class GistQuestionService
  
  def initialize(question, client:)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])
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

  def call
    @client.create_gist(gist_params)
  end
end

