class EntriesController < ApplicationController

  get '/entries' do
    require_login
    redirect '/journals'
  end

  # create
  post '/entries' do
    @entry = current_user.entries.create(journal_id: params[:journal_id], user_id: params[:user_id], title:params[:title], date:params[:date], description:params[:description])
    redirect "/journals/#{@entry.journal_id}"
  end

  # edit
  get '/entries/:id/edit' do
    require_login
    if @entry = current_user.entries.find_by(id: params[:id])
      if @entry.user_id == current_user.id
        erb :'entries/edit'
      else 
        redirect '/journals'
      end
    else
      redirect '/journals'
    end
  end

  # patch
  patch '/entries/:id' do
    @entry = Entry.find(params[:id])
    @entry.update(title:params[:entry][:title],date:params[:entry][:date],description:params[:entry][:description])
    redirect "/entries/#{@entry.id}"
  end

   # new
  get '/entries/:id/new' do
    require_login
    @journal = params[:id]
    erb :'/entries/new'
  end

  # show 
  get '/entries/:id' do 
    require_login
    if @entry = current_user.entries.find_by(id: params[:id])
      erb :'entries/show' 
    else
      redirect '/journals'
    end
  end 

  # delete
  delete '/entries/:id' do
    require_login
    @entry = current_user.entries.find(params[:id])
      if @entry.user_id == current_user.id
        @entry.destroy
        redirect "/journals/#{@entry.journal_id}"
      else
        redirect '/journals'
      end
  end

end