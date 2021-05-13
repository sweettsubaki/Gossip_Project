class LikesController < ApplicationController
    before_action :find_post
    before_action :find_like, only: [:destroy]
    def index
      @gossip = Gossip.all
    end
    
    def create
      if already_liked?
        flash[:danger] = "Tu ne peux pas liker plus d'une fois"
        redirect_to welcome_index_path(@gossip)
        
        
      else 
      @gossip.likes.create(user_id: current_user.id)
      flash[:success] = "Ton like a été pris en compte ! "
      redirect_to welcome_index_path(@gossip)
    end
  end
    def find_post
      @gossip = Gossip.find(params[:gossip_id])
    end
    
    def find_like
      @like = @gossip.likes.find(params[:id])
   end
   
   def destroy
      if !(already_liked?)
        flash[:notice] = "Impossible de délike."
      else
        @like.destroy
        flash[:notice] = "Impossible de délike."
      end
      redirect_to welcome_index_path(@gossip)
    end 
  end
   
  private
    def already_liked?
      Like.where(user_id: current_user.id, gossip_id:
      params[:gossip_id]).exists?
    end
 


