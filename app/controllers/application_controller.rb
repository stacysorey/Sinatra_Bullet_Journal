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

end
