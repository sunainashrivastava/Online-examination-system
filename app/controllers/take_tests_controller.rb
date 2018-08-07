# frozen_string_literal: true

# taketest controller
class TakeTestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token
  respond_to :js, :html

  def new
    @take_test = TakeTest.new
    @take_test.pictures.build
  end

  def questions
    @questions = TakeTest.where(type: params[:type])
    @questions = @questions.paginate(page: params[:page], per_page: 5)
  end

  def create
    take_test = TakeTest.new(take_test_params)
    if take_test.save
      id = take_test.id
      redirect_to take_test_path(id: id)
    else
      flash[:alert] = 'All fields are compulsory...except image upload'
      render 'new'
    end
  end

  def show
    begin
    take_test = TakeTest.find(params[:id])
      debugger
      @take_test = take_test
    rescue RecordNotFound => e
      debugger
      render 'take_tests/error404'
    end
  end

  def index; end

  def error404; end

  def destroy
    take_test = TakeTest.find(params[:id])
    type = take_test.type
    take_test.destroy
    redirect_to questions_path(type: type)
  end

  private

  def take_test_params
    params.require(:take_test).permit(:type,
                                      :sno,
                                      :question,
                                      :op1,
                                      :op2,
                                      :op3,
                                      :op4,
                                      :ans,
                                      pictures_attributes: [:avatar])
  end
end
