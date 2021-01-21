class EntriesController < ApplicationController

  get '/entries' do
    if logged_in?
      redirect '/journals'
    else
      redirect '/login' 
    end
  end

  # create
  post '/entries' do
    @entry = Entry.create(journal_id: params[:journal_id], title:params[:title], date:params[:date], description:params[:description])
    redirect "/journals/#{@entry.journal_id}"
  end

  # edit
  get '/entries/:id/edit' do
    if logged_in?
      @entry = Entry.find(params[:id])
      erb :'entries/edit'
    else
      redirect '/login'
    end
  end

  # patch
  patch '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.update(title:params[:title],date:params[:date],description:params[:description])
    redirect "/entries/#{@entry.id}"
  end

   # new
  get '/entries/:id/new' do
    if logged_in?
      @journal = params[:id]
      erb :'/entries/new'
    else
      redirect '/login'
    end
  end

  # show 
  get '/entries/:id' do 
    if logged_in?
      @entry = Entry.find(params[:id])
      erb :'entries/show' 
    else
      redirect '/login'
    end
  end 

  # delete
  delete 'entries/:id' do
    if logged_in?
      @entry = Entry.find(params[:id])
      @entry.destroy
      redirect '/journals'
    else
      redirect '/login'
    end
  end

end