class JournalsController < ApplicationController

  get '/journals' do
    if logged_in?
      @journal = current_user.journals
      erb :'/journals/index'
    else
      redirect '/login'
    end
  end

  # create
  post '/journals' do
    @journal = current_user.journals.create(title: params[:title], user_id: params[:user_id])
    redirect to ("/journals/#{@journal.id}")
  end

  # edit
  get '/journals/:id/edit' do
    if logged_in?
      @journal = Journal.find(params[:id])
      erb :'journals/edit'
    else 
      redirect '/login'
    end
  end

  # patch
  patch '/journals/:id' do
    @journal = Journal.find(params[:id])
    @journal.update(title:params[:title])
    redirect "/journals/#{@journal.id}"
  end

  # show 
  get '/journals/:id' do 
    if logged_in? 
      @journal = current_user.journals.find(params[:id])
      # need to make it where it will reroute to /journals if 
      # journals/:id != current_user.
      erb :'journals/show'
    else
      redirect '/login'
    end
  end 

  # new
  get '/journals/new' do
    if logged_in?
      @user_id = params[:id]
      erb :'journals/new'
    else
      redirect '/login'
    end
  end

  # delete
  delete 'journals/:id' do
    if logged_in?
      @journal = Journal.find(params[:id])
      @journal.destroy
      redirect '/journals'
    else
      redirect '/login'
    end
  end

end