class SessionsController < ApplicationController
  # user can login 
  # user can logout

  get '/login' do
    erb :'users/login' 
  end

  post '/login' do
    if params[:username].blank? || params[:password].blank?
      @error = "Username and password can't be blank."
      erb :'users/login'
    else 
        @user = User.find_by(username:params[:username]) 
          if @user && @user.authenticate(params[:password])
          session[:user_id] =  @user.id
          redirect '/journals'
        else
          @error = "Invalid username or password."
          erb :'users/login'
        end
    end 
  end 

  get '/logout' do
    session.destroy 
    redirect '/' 
  end 

end