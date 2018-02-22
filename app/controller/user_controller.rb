class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect '/consoles'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect '/consoles'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "You must enter a username AND a password"
      redirect '/signup'
    elsif duplicate_user?(params[:username])
      flash[:user_exists] = "This user already exists, create a new username or click log in."
      redirect '/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/consoles'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/'
    else
      redirect '/'
    end
  end

end
