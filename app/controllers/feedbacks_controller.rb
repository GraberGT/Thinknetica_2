class FeedbacksController < ApplicationController
  before_action :find_test, only: :start

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params.require(:feedback).permit(:message))

    if @feedback.save
      FeedbackMailer.send_feedback(@feedback).deliver_now
      redirect_to root_path, notice: t('.success')
    else
      render :new, notice: t('.failure')
    end
  end
end
