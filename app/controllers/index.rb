# MAINLINE CONTROLLER

get '/' do
  # session[:user_id] = get_guest
	erb :index
  redirect '/decks'
end

# SHOWS AVAILABLE DECKS FOR CHOOSING
get '/decks' do
  @decks = Deck.all
  erb :"decks/index"
end

get "/session/viewer" do
  session.inspect
end

get "/session/clear" do
  session.clear
end
