class GistQuestionService
  
  attr_reader :client

  def initialize(question, client:)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    statuses = *(200..209)
    statuses.include?(self.client.last_response.status.to_i)
  end

  def url
    self.client.last_response.headers[:location]
  end
  
  private

  def gist_params
    { 
      description: I18n.t('gist_question_service.description', test_title: @test.title),
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
