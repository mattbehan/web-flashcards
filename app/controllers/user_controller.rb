# SHOW SESSION USER'S STATS PROFILE
get '/users' do
  # code to deny back-door entry
 # @this_user = User.find_by(session[:uid])
  if authenticated?(this_user)
    @user = {username: "Jabloni"}
    erb :"users/index"
  else
    redirect '/'
  end
end

# NEW USER REGISTRATION
get '/users/new' do
  erb :"users/new"
end

# VALIDATE AND ADD NEW USER
post '/users' do
  @candidate = User.find_by(email: params[:email])
  if @candidate
    # user already exists
    # set message
    redirect '/users/new'
  else
    # create user
    redirect '/' # or somewhere better
  end
end

#-----------
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
    session[:user_id] = @candidate.id
    redirect '/' # or somewhere better
  else
    redirect '/sessions/new'
  end
end

# PROCESS LOGOUT REQUEST
get '/logout' do
  session[:user_id] = nil  # or get-guest
  redirect '/'
end



