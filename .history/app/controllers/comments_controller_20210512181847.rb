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
    coms = Comment.create(coms_params)
    redirect_backei
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
