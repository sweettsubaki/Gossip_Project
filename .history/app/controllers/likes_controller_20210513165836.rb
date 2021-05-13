class LikesController < ApplicationController
    before_action :find_post
    def index
      @gossip = Gossip.all
    end
    
    def create
      if already_liked?
        flash[:notice] = "You can't like more than once"
      else 
      @gossip.likes.create(user_id: current_user.id)
      redirect_to welcome_index_path(@gossip)
    end
  end
    def find_post
      @gossip = Gossip.find(params[:gossip_id])
    end
  
   
  end

