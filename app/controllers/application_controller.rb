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

  helpers do
    def logged_in?
     !current_user.nil?
    end

    def current_user
      @current_user ||= User.find_by(session[:user_id])
    end
  end 
  
end
