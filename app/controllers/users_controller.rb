class UsersController < ApplicationController

  get '/sign_up' do
      erb :'users/sign_up' 
  end
  
  post '/sign_up' do
      @user = User.new(params)
       if @user.save 
          session[:user_id] = @user.id
          redirect '/journals'
       else 
          @password = params[:password]
          @error = @user.errors.full_messages
          erb :'users/sign_up'
       end 
  end 

  get '/login' do
      erb :'users/login' 
  end
  
  post '/login' do
      @user = User.find_by(username:params[:username])
      if @user && @user.authenticate(params[:password])
          session[:user_id] =  @user.id
          redirect "/journals"
      else 
          @error = "Sorry, Either Username or Password is Incorrect, please try again"
          erb :'users/login'
      end 
  end 

  get '/logout' do
      session.destroy 
      redirect '/' 
  end
end 