class JournalsController < ApplicationController

  get '/journals' do
    erb :'journals/index'
  end

  #create
  post '/journals' do
    @journal = Journal.create(title:params[:title])
    redirect to ("/journals/#{@journal.id}")
  end

  # show 
  get "/journals/:id" do 
    @journal = Journal.find(params[:id])
    erb :'journals/show' 
  end 

end