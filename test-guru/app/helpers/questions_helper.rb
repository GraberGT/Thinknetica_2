module QuestionsHelper
  ACTIONS ={ :create => 'Create New', :edit => 'Edit' }.freeze

  def question_header(test, action)
    "#{ACTIONS[action]} #{test.title} Question"
  end
end


