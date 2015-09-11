# MAINLINE CONTROLLER

get '/' do
  redirect '/decks'
end

# SHOWS AVAILABLE DECKS FOR CHOOSING
get '/decks' do
  # @decks = Decks.all
  @decks = [{name: "First", id: 3},{name: "World Capitals", id: 27}]
  erb :"decks/index"
end

get "/session/viewer" do
  session.inspect
end

get "/session/clear" do
  session.clear
end
