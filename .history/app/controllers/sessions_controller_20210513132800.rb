class SessionsController < ApplicationController
  def new
    current_user = nil
  end

  def create
    user = User.find_by(email: params[:email])


  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    flash.now[:success] = 'Email ou mot de passe invalide.'
    redirect_to welcome_index_path

  else
    flash.now[:danger] = 'Email ou mot de passe invalide.'
    render 'new'
  end
  end

  def destroy
    session.delete(:user_id)
  end
end
