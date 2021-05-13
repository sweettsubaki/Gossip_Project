class GossipController < ApplicationController
 # before_action :authenticate_user
  def index
    @id = params[:id]
    @gossips = Gossip.all
    @tags = Tag.all
    @tjg = TagJoinGossip.all
  end 
  
 

  def show
    @id= params[:id]
    @gossip = Gossip.find(params[:id])
    @comments = Gossip.find(params[:id]).comments
    @comment = Comment.new(content: params['content'], gossip_id: 1, gossip_id: @gossip ,user_id: 1)
  end
 
 
    def new
     @gossip = Gossip.new
     
    end
    
    def create
      
      @gossip = Gossip.new(title: params['title'], content: params['content'])
      @gossip.user = User.find_by(id: session[:user_id])

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
      
      @tgp = TagJoinGossip.all
      @tgp.destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      redirect_to welcome_index_path
    end
  end

  private

 # def authenticate_user
   # unless current_user
    #  flash[:danger] = "Veuillez vous connecter."
     # redirect_to new_session_path
    #end
  #end
