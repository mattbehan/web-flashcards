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

# ----------

get '/sessions' do
end

# SHOW LOGIN FORM UPON USER REQUEST TO LOGIN
get '/sessions/new' do
  erb :'sessions/new'
end

# PROCESS LOGIN REQUEST
post '/sessions' do
  @candidate = User.find_by(email: params[:email])
  if @candidate &&
      @candidate.correct_password?(params[:pwd])
    session[:uid] = @candidate.id
    redirect '/' # or somewhere better
  else
    redirect '/sessions/new'
  end
end

get '/logout' do
  session[:uid] = nil
  redirect '/'
end

#
