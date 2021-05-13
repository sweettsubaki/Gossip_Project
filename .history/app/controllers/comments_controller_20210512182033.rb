class CommentsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @comment = Comment.new
    @gossip = params[:id]
  end

  def create
    
  end

  private

  def coms_params
    params.require(:post).permit(:content)

  def edit
  end

  def update
  end

  def destroy
  end
end
