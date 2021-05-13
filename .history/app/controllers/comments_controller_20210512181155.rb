class CommentsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    
  end

  private

  def coms_params
    params.require(:content).permiet()

  def edit
  end

  def update
  end

  def destroy
  end
end
