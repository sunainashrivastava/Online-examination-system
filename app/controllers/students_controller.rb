# frozen_string_literal: true

# Student controller
class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def displays
    @questions = TakeTest.find_by(type: params[:value])
  end

  def change_question
    question = TakeTest.find(params[:id])
    sno = question.sno + 1
    @questions = TakeTest.where(sno: sno, type: question.type).first
    user_response = params[:user_answer]
    result = (question.ans == user_response)
    TakeTestUser.create(question_id: params[:id], result: result, user_id: current_user.id, take_test_id: current_user.id)
    @time = TakeTestUser.first.created_at
    redirect_to action: 'result' if sno == 11
  end

  def result
    user_record = TakeTestUser.first
    if user_record
      question = TakeTest.find_by(id: user_record.question_id)
      @type = question.type
      @score = TakeTestUser.where(result: true).count
      Record.create(user_id: current_user.id, take_test_id: current_user.id, scores: @score, attempt_time: Time.now + 5.hours + 30.minutes)
      TakeTestUser.delete_all
      UserMailer.score_email(current_user, @score).deliver
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: 'generate_result' # Excluding ".pdf" extension.
        end
      end
    else
      render 'error'
    end
  end

  def records
    @records = Record.where(user_id: current_user.id)
  end

  def view_answers
    @solutions = TakeTest.where(type: params[:type])
  end

  def error; end
end
