get "/rounds/:round_id/cards/:card_id" do
  @card = Card.find_by(id: params[:card_id])
  @round = Round.find_by(id: params[:round_id])
  erb :"cards/show"
end

get "/rounds/:id/cards" do
  round = Round.find_by(id: params[:id])
  unless round.finished?
    redirect "/rounds/:round_id/cards/#{round.next_card}"
  else
    redirect "/rounds/:id/finished"
  end
end
