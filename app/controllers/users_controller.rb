# frozen_string_literal: true

# user controller
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index new]
  load_and_authorize_resource
  def index; end

  def new
    @user = User.new
  end

  def create; end
end
