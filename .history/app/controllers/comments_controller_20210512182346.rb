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
    comment_params = params.require(:gossip).permit(:title, :content)
  end

  private

  def comment_params
    params.require(:post).permit(:content)

  def edit
  end

  def update
  end

  def destroy
  end
end
