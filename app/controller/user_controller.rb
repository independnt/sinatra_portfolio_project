class UserController < ApplicationController
  register Sinatra::Flash

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/consoles'
    end
  end

  post '/signup' do
    puts params
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "You must enter a username AND a password"
      redirect '/signup'
    end

  end

end
