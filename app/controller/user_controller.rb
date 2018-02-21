class UserController < ApplicationController

  get '/signup' do

    erb :'users/create_user'
  end

end
