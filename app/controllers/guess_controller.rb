get "/guesses/:id" do
  @guess = Guess.find(params[:id])
  @round = Round.find(@guess.round_id)
  @deck = @round.deck
  erb :"guesses/show"
end

post "/guesses" do
 @guess = Guess.create(round_id: params[:round], card_id: params[:card])
 card = Card.find_by(id: params[:card])
  if params[:guess].downcase == Card.find_by(id: params[:card]).answer.downcase
    @guess.complete = true
    @guess.save
  end
 redirect to "/guesses/#{@guess.id}"
end


