require 'sinatra'
enable :sessions

get '/' do
    erb :index
end

post '/choosing' do
    session[:sauce_type] = params[:sauce]
    session[:meat_type] = params[:meat]
    session[:veg_type] = params[:veg]
    redirect '/confirm'
end

get '/confirm' do
    erb :confirm, locals: {sauce: session[:sauce_type], meat: session[:meat_type], veg: session[:veg_type]}
end
