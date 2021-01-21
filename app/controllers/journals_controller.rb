class JournalsController < ApplicationController

  get '/journals' do
    if logged_in?
      @journal = Journal.all
      erb :'/journals/index'
    else
      redirect '/login'
    end
  end

  # create
  post '/journals' do
    @journal = Journal.create(title: params[:title])
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
      @journal = Journal.find(params[:id])
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