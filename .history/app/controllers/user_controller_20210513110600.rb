class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @id = User.new
end

  def create
    @id = User(params[:id])

    user_params = params.require(:user).permit(:first_name, :last_name, :email, :age, :city, :password, :description)
   
    @id = User.new(user_params)
    
    if @id.save
      flash[:success] = "Inscription réussite !"
      redirect_to gossip_index_path
    else
      flash[:danger] = "ERREUR ! : #{@user.errors.full_messages.join(" , ")}"
      render new_user_path


    end
end

   
end