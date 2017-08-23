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

post '/confirm' do
    session[:sauce_choice] = params[:sauce_radio] 
    session[:meat_choice] = params[:meat_radio]
    session[:veg_choice] = params[:veg_radio]
    redirect '/results'
end

get '/results' do
    erb :results, locals: {sauce_final: session[:sauce_choice], meat_final: session[:meat_choice], veg_final: session[:veg_choice]}
end
