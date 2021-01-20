class EntriesController < ApplicationController

  get '/entries' do

    @entry = Entry.all
    erb :'/entries/index'
  end

  # create
  post '/entries' do
    
    @entry = Entry.create(title:params[:title], date:params[:date], description:params[:description])
    
    redirect to ("/entries/#{@entry.id}")
  end

  # edit
  get '/entries/:id/edit' do
    @entry = Entry.find(params[:id])
    erb :'entries/edit'
  end

  # patch
  patch '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.update(title:params[:title],date:params[:date],description:params[:description])
    redirect "/entries/#{@entry.id}"
  end

  # show 
  get '/entries/:id' do 
    @entry = Entry.find(params[:id])
    
    erb :'entries/show' 
  end 

  # new
  get '/entries/new' do
    erb :'/entries/new'
  end

  # delete
  delete 'entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect '/entries'
  end

end