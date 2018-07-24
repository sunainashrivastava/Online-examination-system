class TakeTestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token

  def new
    @take_test = TakeTest.new
    @take_test.pictures.build
  end

  def questions
    @questions = TakeTest.where(type: params[:type])  
  end

  def create
    @take_test = TakeTest.new(take_test_params)
    if @take_test.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @take_test = TakeTest.find(params[:id])
  end

  def index
  end
  
  def destroy
    @take_test = TakeTest.find(params[:id])
    @take_test.destroy
    redirect_to questions_path
  end

  private
  def take_test_params
    params.require(:take_test).permit(:type, :sno, :question, :op1, :op2,
      :op3, :op4, :ans, :pictures_attributes => [:avatar])
  end
end

