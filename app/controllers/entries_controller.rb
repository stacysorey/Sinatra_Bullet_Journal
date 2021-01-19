class EntriesController < ApplicationController

  get '/entry' do
    erb :'/entries/index'
  end

  get '/new_entry' do
    erb :'/entries/new'
  end

end