class ConsoleController < ApplicationController

  get '/home' do
    if logged_in?
      erb :'/consoles/index'
    else
      redirect '/login'
    end
  end

  get '/consoles/:id' do
    if logged_in?
      @console = Console.find_by_id(params[:id])
      erb :'consoles/show'
    else
      redirect '/login'
    end
  end

  get '/consoles/:id/edit' do
    if logged_in?
      @console = Console.find_by_id(params[:id])
      erb :'consoles/edit'
    else
      redirect '/login'
    end
  end


end
