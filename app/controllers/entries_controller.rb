class EntriesController < ApplicationController

  get '/entry' do
    erb :'/entries/index'
  end

  # create
  post '/entry' do
    
    @entry = Entry.create(title:params[:title], date:params[:date], description:params[:description])
    
    redirect to ("/entry/#{@entry.id}")
  end

  # edit
  get '/entry/:id/edit' do
    @entry = Entry.find(params[:id])
    erb :'entries/edit'
  end

  # patch
  patch '/entry/:id' do
    @entry = Entry.find(params[:id])
    @entry.update(title:params[:title],date:params[:date],description:params[:description])
    redirect "/entry/#{@entry.id}"
  end

  # show 
  get '/entry/:id' do 
    @entry = Entry.find(params[:id])
    
    erb :'entries/show' 
  end 

  # new
  get '/new_entry' do
    erb :'/entries/new'
  end

  # delete
  delete 'entry/:id' do
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect '/entry'
  end

end