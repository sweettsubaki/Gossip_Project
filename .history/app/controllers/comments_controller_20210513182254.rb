class CommentsController < ApplicationController

def index
  @comments = Comment.all
  @users = User.all
end

def new
  # Pour revenir au gossip sur lequel on ajoute un commentaire
  @gossip = Gossip.find(params[:gossip_id]) 
  # Pour ajouter un commentaire
  @comment = Comment.new
end

def edit
  @comment = Comment.find(params[:id])
end


def create
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.new(content: params[:content], gossip: @gossip (user_id: current_user.id)

  if @comment.save 
    flash[:success] = "Commentaire ajouté ! 👍"
    redirect_to gossip_path(@gossip.id)
  else
   redirect_to gossip_path(@gossip.id)
 end
end


def update
@comment = Comment.find(params[:id])
@gossip = Gossip.find(params[:gossip_id])

if @comment.update(content: params[:content])

  flash[:success] = "Gossip bien modifié ! 👍"
  redirect_to gossip_path(@gossip.id)
else
  render 'edit'
end
end

def destroy
@gossip = Gossip.find(params[:gossip_id])
@comment = Comment.find(params[:id])


@comment.destroy
flash[:alert] = "Commentaire supprimé ! 🗑️"
redirect_to gossip_path(@gossip.id)
end
end

