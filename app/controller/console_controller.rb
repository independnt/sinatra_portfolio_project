require 'pry'
class ConsoleController < ApplicationController

  get '/consoles' do
    if logged_in?
      erb :'/consoles/index'
    else
      redirect '/login'
    end
  end

  get '/consoles/:id' do
    @console = Console.find_by_id(params[:id])
    if logged_in? && current_user.consoles.include?(@console)
        erb :'consoles/show'
    else
      redirect '/login'
    end
  end

  get '/consoles/:id/edit' do
    @console = Console.find_by_id(params[:id])
    if logged_in? && current_user.consoles.include?(@console)
      erb :'consoles/edit'
    else
      redirect '/login'
    end
  end

  patch '/consoles/:id' do
    if logged_in? && current_user.consoles.include?(@console)
      @console = Console.find_by_id(params[:id])
      @console.update(name: params[:name])
      @console.save
      flash[:console_success] = "Your console has been updated!"
      redirect "/consoles/#{@console.id}"
    else
      redirect '/login'
    end
  end


end
