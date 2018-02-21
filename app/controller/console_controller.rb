class ConsoleController < ApplicationController

  get '/home' do
    if logged_in?
      @consoles = Console.all
      erb :'/consoles/index'
    else
      redirect '/login'
    end   
  end

end
