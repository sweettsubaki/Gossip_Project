class CommentsController < ApplicationController
  def index
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def create
    coms = Comment.create(post)
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
