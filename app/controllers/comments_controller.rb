class CommentsController < ApplicationController

def index
  @comments = Comment.all
end

def new
   @gossip = Gossip.find(params[:gossip_id]) 
  @comment = Comment.new
end

def edit
  @comment = Comment.find(params[:id])
end


def create
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.new(content: params[:content], gossip: @gossip)
  @comment.user = User.find_by(id: session[:user_id])

  if @comment.save 
    flash[:success] = "Votre commentaire vient d'ếtre publié avec succès"
    redirect_to gossip_path(@gossip.id)
  else
   redirect_to gossip_path(@gossip.id)
 end
end


def update
@comment = Comment.find(params[:id])
@gossip = Gossip.find(params[:gossip_id])

if @comment.update(content: params[:content])

  flash[:success] = "Votre potin a été modifié avec succès 👍"
  redirect_to gossip_path(@gossip.id)
else
  render 'edit'
end
end

def destroy
@gossip = Gossip.find(params[:gossip_id])
@comment = Comment.find(params[:id])


@comment.destroy
flash[:alert] = "Commentaire supprimé avec succès 🗑️"
redirect_to gossip_path(@gossip.id)
end
end

