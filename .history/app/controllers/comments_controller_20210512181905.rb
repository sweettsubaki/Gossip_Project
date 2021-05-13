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
    @gossip = params[:id]
    @comment = Comment.new(content: params['content'], gossip_id: 1, gossip_id: @gossip ,user_id: 1) # avec xxx qui sont les données obtenues à partir du formulaire
      
        if @comment.save # essaie de sauvegarder en base @gossip
          flash[:success] = "commentaire bien créé!"
          redirect_to gossip_show_path
  
          # si ça marche, il redirige vers la page d'index du site
        else
          flash[:danger] = "Nous n'avons pas réussi à créer le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(" , ")}"
          render gossip_show_path
          # sinon, il render la view new (qui est celle sur laquelle on est déjà)
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
