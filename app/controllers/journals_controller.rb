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
      if @journal = current_user.journals.find_by(id: params[:id])
        if @journal.user_id == current_user.id
          erb :'journals/edit'
        else
          redirect '/journals'
        end
      else
        redirect '/journals'
      end
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
      if @journal = current_user.journals.find_by(id: params[:id])
        erb :'journals/show' 
      else
        redirect '/journals'
      end
  end 

end