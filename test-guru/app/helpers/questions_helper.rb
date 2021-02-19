module QuestionsHelper
  ACTIONS ={ :create => 'Create New', :edit => 'Edit' }.freeze

  def question_header(question)
    if question.new_record?
      "Create New #{question.test.title} Question"
    else
      "Edit #{question.test.title} Question"
    end
  end
end


