class UsersController < ApplicationController

  get '/sign_up' do
      erb :'users/sign_up' 
  end
  
  post '/sign_up' do
      @user = User.new(params)
       if @user.username.blank? || @user.password_digest.blank?
        @error ="Username and password can't be blank."
          erb :'users/sign_up'
        elsif User.find_by(username: @user.username)
            @error = "Account with that username already exists."
       else 
          @user.save
          session[:user_id] = @user.id
          redirect '/journals'
       end 
  end 


end 