get "/rounds/new" do
  erb :"/rounds/new"
end




post "/rounds" do
  @deck = Deck.find_by(id: params[:deck_id])
  @round = Round.new(deck_id: @deck.id, user_id: session[:user_id])
  if @round.save
    redirect to "/rounds/:round_id/cards/:card_id"
  else
    erb :"/rounds/new"
  end
end

get "/rounds/:round_id/cards/:card_id" do
  @card = Card.find_by(id: params[:card_id])
  @round = Round.find_by(id: params[:round_id])
  erb :"cards/show"
end

post "/guesses" do
 @guess = Guess.create
 redirect to "/guesses/#{@guess.id}"
end

get "/guesses/:id" do
end
