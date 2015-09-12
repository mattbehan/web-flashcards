post "/rounds" do
  @deck = Deck.find_by(id: params[:deck_id].to_i)
  puts "______________________________"
  puts sessions_user_id
  puts @deck.id
  @round = Round.new(deck_id: @deck.id, user_id: sessions_user_id)
  # need to be initializing a new card
  if @round.save
    redirect to "/rounds/#{@round.id}/cards/#{@round.next_card.id}"
  end
end

get "/rounds/:id/finished" do
  erb :"rounds/finished"
end



