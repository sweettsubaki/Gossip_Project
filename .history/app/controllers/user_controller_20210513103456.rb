class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
  end
end
