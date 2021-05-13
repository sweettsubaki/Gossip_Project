class UserController < ApplicationController
  def show
    @id = params[:id]
  end

  def new
    @id = User.new
end

  def create
    @id = User.new()

    user_params = params.permit(:first_name, :last_name, :email, :age, :city_id, :password, :description)
   
    @id = User.new(user_params)
    
    if @id.save
      flash[:success] = "Inscription complète"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Il y a eu une erreur lors de votre inscription : #{@id.errors.full_messages.join(" , ")}"
      render new_user_path


    end
end

   
end