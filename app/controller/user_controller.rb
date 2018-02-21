class UserController < ApplicationController

  get '/signup' do

    erb :'users/create_user'
  end

  helper do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end


  end

end
