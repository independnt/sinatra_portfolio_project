require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "notsureyet"
  end

  get '/' do
    if !logged_in?
      erb :index
    else
      redirect '/home'
    end
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        redirect to '/home'
      else
        flash[:login_error] = "Your username or password doesn't match our records, please try again!"
        redirect '/login'
      end
    end


  end

end
