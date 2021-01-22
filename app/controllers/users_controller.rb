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
         @error = "Invalid credentials or username already taken."
         erb :'/users/sign_up'
       end 
  end 


end 