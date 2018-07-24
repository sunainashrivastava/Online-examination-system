class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:index, :new]
  load_and_authorize_resource
  def index
  end
 
  def new
  	@user = User.new
  end
  
  def create
  end
end

