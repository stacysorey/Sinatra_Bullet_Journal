class EntriesController < ApplicationController

  get '/entries' do

    @entry = Entry.all
    erb :'/entries/index'
  end

  # create
  post '/entries' do
    
    @entry = Entry.create(journal_id: params[:journal_id], title:params[:title], date:params[:date], description:params[:description])
    
    redirect to ("/journals/#{@entry.journal_id}")
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

   # new
  get '/entries/:id/new' do
    @journal = params[:id]
    erb :'/entries/new'
  end

  # show 
  get '/entries/:id' do 
    @entry = Entry.find(params[:id])
    
    erb :'entries/show' 
  end 

 

  # delete
  delete 'entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect '/entries'
  end

end