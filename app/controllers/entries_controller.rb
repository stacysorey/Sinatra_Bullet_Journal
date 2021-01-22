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
    @entry = current_user.entries.find_by(id: params[:id])
    if @entry.user_id == current_user.id
      erb :'entries/edit'
    else 
      redirect "/journals/"
    end
      # same authentication issue with journal
      # user CANNOT see entries that don't belong to them yet
      # BUT it links to code break page
    erb :'entries/edit'
    # entry information disappearing after editing
    # editing is literally clearing all of the information
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
    @entry = current_user.entries.find(params[:id])
    if @entry
    erb :'entries/show' 
    else
      redirect '/journals'
    end
  end 

  # delete
  delete '/entries/:id' do
    require_login
    @entry = current_user.entries.find(params[:id])
    @entry.destroy
    redirect '/journals'
    # delete also not working here in web app
    # delete works in tux
  end

end