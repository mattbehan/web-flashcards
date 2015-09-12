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
