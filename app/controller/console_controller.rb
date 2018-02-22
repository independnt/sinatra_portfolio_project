require 'pry'
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

  patch '/consoles/:id' do
    @console = Console.find_by_id(params[:id])
    @console.update(name: params[:name])
    @console.save
    flash[:console_success] = "Your console has been updated!"
    redirect "/consoles/#{@console.id}"
  end


end
