class EntriesController < ApplicationController

  get '/entry' do
    erb :'/entries/index'
  end

end