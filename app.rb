require 'sinatra'
enable :sessions

get '/' do
    erb :index
end

post '/chooding' do
    session[:options] = params[:sauce]
end

