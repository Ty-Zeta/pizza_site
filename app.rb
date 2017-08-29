require 'sinatra'
enable :sessions

get '/' do
    erb :del
end

post '/delivery' do
    session[:del_choice] = params[:delivery]
    if session[:del_choice] == "no_del"
        redirect '/index'
    elsif 
        redirect '/address'
    end
end

get '/address' do
    erb :address, locals: {yes_del: session[:del_choice]}
end

post '/address' do
    session[:del_address] = params[:take_pizza_here]
    session[:del_choice] = params[:yes_del]
    redirect '/index'
end

get '/index' do
    erb :index, locals: {take_pizza_here: session[:del_address]}
end

post '/choosing' do
    session[:pizza_size] = params[:size]
    session[:sauce_type] = params[:sauce]
    session[:meat_type] = params[:meat]
    session[:veg_type] = params[:veg]
    redirect '/confirm'
end

get '/confirm' do
    erb :confirm, locals: {sauce: session[:sauce_type], meat: session[:meat_type], veg: session[:veg_type], size: session[:pizza_size]}
end

post '/confirm' do
    session[:pizza_choice] = params[:size_radio]
    session[:sauce_choice] = params[:sauce_radio] 
    session[:meat_choice] = params[:meat_radio]
    session[:veg_choice] = params[:veg_radio]
    current_pizza = params[:total].to_i || 0
   session[:total] = session[:total] || 0
    p "your total is #{session[:total]}"
    session[:total] = session[:total] + current_pizza
    p "Your current_pizza is #{session[:total]}"

    redirect '/results'
end

get '/results' do
    erb :results, locals: {sauce_final: session[:sauce_choice], meat_final: session[:meat_choice], veg_final: session[:veg_choice], take_pizza_here: session[:del_address], size_final: session[:pizza_choice], total_final: session[:total]}
end
