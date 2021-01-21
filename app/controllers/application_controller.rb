require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password"
    # allows us to use patch / delete request 
    set :method_override, true 
  end

  get "/" do
    erb :welcome
  end


  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def require_login
    unless logged_in?
      redirect "/login"
    end
  end

end
