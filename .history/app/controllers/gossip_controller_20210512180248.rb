class GossipController < ApplicationController
  
  def index
    
  end 

  def show
    @id = params[:id]
    @gossip = Gossip.all
    @comment = Gossip.find(params[:id]).comments
  end
    
    def new
     @gossip = Gossip.new
     @comment = Comment.new
    end
  
    def create
      @gossip = Gossip.new(title: params['title'], content: params['content'], user_id: 1)

      if @gossip.save
        flash[:success] = "Gossip bien créé!"
        redirect_to welcome_index_path

      else
        flash[:danger] = "Nous n'avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) "
        render new_gossip_path
        
    end
  end
  
    def edit
      @gossip = Gossip.find(params[:id])
    end
  
    def update
      @gossip = Gossip.find(params[:id])

      gossip_params = params.require(:gossip).permit(:title, :content)

      if @gossip.update(gossip_params)
        flash[:success] = "Gossip bien modifié !"
         redirect_to welcome_index_path
      else
        render :edit   
        flash[:danger] = "Nous n'avons pas réussi à modifier le potin, le titre doit faire 3 lettres minimum et vous devez remplir le contenu."
    end
  end
  
    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to welcome_index_path
    end
  end
