class LikesController < ApplicationController
    before_action :find_post
    def index
      @gossip = Gossip.all
    end
    
    def create
      @gossip.likes.create(user_id: current_user.id)
      redirect_to welcome_index_path(@gossip)
    end
    private
    def find_post
      @gossip = Gossip.find(params[:gossip_id])
    end

    private
    def already_liked?
      Like.where(user_id: current_user.id, gossip_id:
      params[:gossip_id]).exists?
    end
  end

