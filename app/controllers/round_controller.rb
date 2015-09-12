get "/rounds/new" do
  erb :"rounds/new"
end

post "/rounds" do
  @deck = Deck.find_by(id: params[:deck_id])
  @round = Round.new(deck_id: @deck.id, user_id: sessions_user_id)
  # need to be initializing a new card
  if @round.save
    redirect to "/rounds/:round_id/cards/:card_id"
  else
    erb :"rounds/new"
  end
end

get "/rounds/:round_id/cards/:card_id" do
  @card = Card.find_by(id: params[:card_id])
  @round = Round.find_by(id: params[:round_id])
  erb :"cards/show"
end

post "/guesses" do
 @guess = Guess.create(round_id: params[:round], card_id: params[:card])
  if params[:guess] == Card.find_by(id: params[:card]).answer
    @guess.correct = true
  end
 redirect to "/guesses/#{@guess.id}"
end

get "/guesses/:id" do
  @guess = Guess.find_by(id: params[:id])
  @round = Round.find_by(id: @guess.round_id)
  @deck = current_rounds_deck
  erb :"guesses/show"
end

get "/rounds/:id/cards" do
  round = Round.find_by(id: params[:id])
  unless round.finished?
    redirect "/rounds/:round_id/cards/#{round.next_card}"
  else
    redirect "/rounds/:id/finished"
  end
end

