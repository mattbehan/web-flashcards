# MAINLINE CONTROLLER

get '/' do
	erb :index
  redirect '/decks'
end

# SHOWS AVAILABLE DECKS FOR CHOOSING

get "/session/viewer" do
  session.inspect
end

get "/session/clear" do
  session.clear
end
