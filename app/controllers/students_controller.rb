# frozen_string_literal: true

# Student controller
class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    TakeTestUser.delete_all
  end

  def displays
    @questions = TakeTest.find_by(type: params[:value])
  end

  def change_question
    question = TakeTest.find(params[:id])
    sno = question.sno + 1
    @questions = TakeTest.find_by(sno: sno, type: question.type)
    result = (question.ans == params[:user_answer])
    current_user.take_test_users.create(question_id: params[:id],
                                        result: result,
                                        take_test_id: current_user.id)
    redirect_to action: 'result' if sno == 11
  end

  def result
    user_record = TakeTestUser.first
    if user_record
      time_taken = TakeTestUser.last.created_at - TakeTestUser.first.created_at
      @time_taken = Time.at(time_taken) - 30.minutes + 1.seconds
      @type = TakeTest.find_by(id: user_record.question_id).type
      Record.create(user_id: current_user.id,
                    take_test_id: current_user.id,
                    scores: TakeTestUser.where(result: true).count,
                    attempt_time: Time.now + 5.hours + 30.minutes)
      # UserMailer.score_email(current_user, @score).deliver
      debugger
    else
      render 'error'
    end
  end

  def records
    @records = Record.where(user_id: current_user.id)
    @records = @records.paginate(page: params[:page], per_page: 10)
  end

  def view_answers
    @solutions = TakeTest.where(type: params[:type]).limit(10)
  end

  def error; end

  def generate_result
    @score = params[:score]
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'generate_result' # Excluding ".pdf" extension.
      end
    end
  end
end
