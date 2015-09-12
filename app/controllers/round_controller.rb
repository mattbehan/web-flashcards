get "/decks/deck_id/rounds/new" do
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

get "/rounds/:id/finished" do
erb :"rounds/finished"
end



