class GamesController < ApplicationController

    get '/games/new' do
      if logged_in?
        erb :'games/create_game'
      else
        redirect '/login'
    end
end
