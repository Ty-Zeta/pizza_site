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
    session[:sauce_choice] = params[:sauce_yes] 
    session[:meat_choice] = params[:meat_yes]
    session[:veg_choice] = params[:veg_yes]
    p "#{veg_choice} HEY DUMMY!!!"
    redirect '/results'
end

get '/results' do
    erb :results, locals: {sauce_yes: session[:sauce_choice], meat_yes: session[:meat_choice], veg_yes: session[:veg_choice]}
end
