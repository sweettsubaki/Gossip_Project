class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @id = User.new
end

  def create
    @id = Gossip.find(params[:id])

    gossip_params = params.require(:gossip).permit(:title, :content)
   
    @id = User.new  User.new(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], age: params['age'], city_id: params['city_name'], password: params['password'], description: params['description'])
    
    if @id.save
      flash[:success] = "Inscription réussite !"
      redirect_to gossip_index_path
    else
      flash[:danger] = "ERREUR ! : #{@user.errors.full_messages.join(" , ")}"
      render new_user_path


    end
end

  def update 
end