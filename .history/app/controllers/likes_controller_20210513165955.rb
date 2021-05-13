class LikesController < ApplicationController
    before_action :find_post
    def index
      @gossip = Gossip.all
    end
    
    def create
      if already_liked?
        flash.now[:danger] = "Tu ne peux pas liker plus d'une fois"
      else 
      @gossip.likes.create(user_id: current_user.id)
      flash[:succes] = "Ton like a été pris en compte ! "
      redirect_to welcome_index_path(@gossip)
    end
  end
    def find_post
      @gossip = Gossip.find(params[:gossip_id])
    end
  end
   
  private
    def already_liked?
      Like.where(user_id: current_user.id, gossip_id:
      params[:gossip_id]).exists?
    end
 


