class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: email_dans_ton_params)

  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(password_dans_ton_params)
    session[:user_id] = user.id
    # redirige où tu veux, avec un flash ou pas

  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
  end
end
