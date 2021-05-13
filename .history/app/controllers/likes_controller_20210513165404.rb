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
      @gossip = Gossip.find(params[:id])
    end
  end

