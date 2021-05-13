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
    comment = Comment.create(comment_params)
    redirect_to_back
  end

  private

  def comment_params
    params.require(:comment).permit(:content)

  def edit
  end

  def update
  end

  def destroy
  end
end
