class ConsoleController < ApplicationController

  get '/home' do
    erb :'/consoles/index'
  end

end
