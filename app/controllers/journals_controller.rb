class JournalsController < ApplicationController

  get '/journals' do
    erb :'journals/index'
  end

end