class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @id = User.new
end

  def create
    @id = User.new
