module GistsHelper
  def short_link_to(question)
    link_to truncate(question.title, length: 25), admin_question_path(question)
  end

  def external_link_to(gist_id)
    link_to gist_id, "#{ENV['GIST_URL']}#{gist_id}", target: '_blank'
  end

  def call
    @client.create_gist(gist_params)
    @client.last_response
  end
end