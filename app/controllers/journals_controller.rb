class JournalsController < ApplicationController


  get '/journals' do
    require_login
      @journal = current_user.journals
      erb :'/journals/index'
  end

  # create
  post '/journals' do
    @journal = current_user.journals.create(title: params[:title], user_id: params[:user_id])
    redirect to ("/journals/#{@journal.id}")
  end

  # edit
  get '/journals/:id/edit' do
    require_login
      @journal = current_user.journals.find(params[:id])
      erb :'journals/edit'
      #need to authenticate that user CAN edit this journal
      #when you edit a journal title, it becomes blank
  end

  # patch
  patch '/journals/:id' do
    @journal = Journal.find(params[:id])
    @journal.update(title:params[:title])
    redirect "/journals/#{@journal.id}"
  end

 # delete
  delete '/journals/:id' do

      @journal = Journal.find(params[:id])
      if @journal.user_id == current_user.id
        @journal.destroy
        redirect '/journals'
      else
        redirect "/journals/#{@journal.id}"
      end
      #not deleting ANYTHING "sinatra doesn't know this ditty"
  end

  # new
  get '/journals/new' do
    require_login
      @user_id = params[:id]
      erb :'journals/new'
  end

  # show 
  get '/journals/:id' do 
    require_login
      @journal = Journal.find(params[:id])
      erb :'journals/show'
      # need to make it where it will reroute to /journals if 
      # journals/:id != current_user.
  end 

 

end