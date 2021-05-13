class LikesController < ApplicationController
    before_action :find_post
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
  def destroy
      if !(already_liked?)
        flash[:notice] = "Cannot unlike"
      else
        @like.destroy
      end
      redirect_to post_path(@post)
    end 
  end
   
  private
    def already_liked?
      Like.where(user_id: current_user.id, gossip_id:
      params[:gossip_id]).exists?
    end
 


