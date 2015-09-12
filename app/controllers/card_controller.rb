get "/rounds/:round_id/cards/:card_id" do
  @card = Card.find_by(id: params[:card_id].to_i)
  @round = Round.find_by(id: params[:round_id].to_i)
  puts "______________________________"
  puts @card
  puts @round
  erb :"cards/show"
end

get "/rounds/:id/cards" do
  round = Round.find_by(id: params[:id])
  if round.finished?
    redirect "/rounds/#{round.id}/finished"
  else
    redirect "/rounds/#{round.id}/cards/#{round.next_card.id}"
  end
end

