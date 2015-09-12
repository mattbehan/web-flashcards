get "/guesses/:id" do
  @guess = Guess.find(params[:id])
  @round = Round.find(@guess.round_id)
  @deck = @round.deck
  erb :"guesses/show"
end

post "/guesses" do
 @guess = Guess.create(round_id: params[:round], card_id: params[:card])
 card = Card.find_by(id: params[:card])
 puts "----------------------"
 p params[:guess]
 p Card.find_by(id: params[:card]).answer
 p @guess.complete
  if params[:guess] == Card.find_by(id: params[:card]).answer
    @guess.complete = true
    @guess.save
  end
 p @guess.complete
 redirect to "/guesses/#{@guess.id}"
end


