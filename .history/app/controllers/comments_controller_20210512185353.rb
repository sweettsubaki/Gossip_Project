class CommentsController < ApplicationController

def index
  @comment = Comment.all
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
 #Récupération des champs du formulaire
 @post = Comment.new(
  'content' => params[:content],
  #'user_id' => User.find_by(first_name: "anonymous").id,
  'comment_type_id' => params[:gossip_id],
  #'comment_type_type' => Gossip
)
#Sauvegarde en BDD
puts ""30""
p @post.comment_type_id
puts ""30
if @post.save
  puts "OK !!!!!!!!!!"
  #redirect_to gossips_path, alert: "Enregistrement réussi !"
else
  flash.now[:alert] = "Echec à l'enregistrement !"
  render gossip_path
end
end


def update
@comment = Comment.find(params[:id])
@gossip = Gossip.find(params[:gossip_id])

if @comment.update(content: params[:content])

  flash[:success] = "Gossip successfully modified! 👍"
  redirect_to gossip_path(@gossip.id)
else
  render 'edit'
end
end

def destroy
@gossip = Gossip.find(params[:gossip_id])
@comment = Comment.find(params[:id])


@comment.destroy
flash[:alert] = "Comment deleted! 🗑️"
redirect_to gossip_path(@gossip.id)
end
end

