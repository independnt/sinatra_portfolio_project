require 'pry'
class GamesController < ApplicationController

    get '/games/new' do
      if logged_in?
        erb :'games/create_game'
      else
        redirect '/login'
      end
    end

    get '/games/:id' do
      if logged_in?
        @game = Game.find_by_id(params[:id])
        erb :'games/show'
      else
        redirect '/login'
      end
    end

    post '/games' do
      if params[:game][:name] == ""
        flash[:game_error] = "Please enter a name for your game."
        redirect '/games/new'
      end
      @game = Game.create(params[:game])
      if !@game.console_id && params[:console_name].empty?
        flash[:console_error] = "Please assign the game a console."
        redirect '/games/new'
      elsif !@game.console_id && !params[:console_name].empty?
        @console = current_user.consoles.build(name: params[:console_name])
        @console.save
        @game.console_id = @console.id
        @game.save
        binding.pry
        redirect "/games/#{@game.id}"
      end
      redirect "/games/#{@game.id}"
    end


end
