class SessionsController < ApplicationController
  def new
    current_user = nil
  end

  def create
    user = User.find_by(email: params[:email])


    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Vous êtes connecté en tant que #{current_user.first_name} ! "
      redirect_to welcome_index_path
      
      remember(user)

    else
      flash.now[:danger] = 'Email ou mot de passe invalide '
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:danger] = 'Vous vous êtes bien déconnecté de votre compte.'
    redirect_to welcome_index_path
  end
end
