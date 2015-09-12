# SHOW SESSION USER'S STATS PROFILE
# on hold pending ROUNDS
# get '/users' do
# # code to deny back-door entry
# # @this_user = User.find_by(session[:uid])
#   if authenticated?
#     erb :"users/index"
#   else
#     redirect '/' # will (re)set user to guest
#   end
# end

# NEW USER REGISTRATION
get '/users/new' do
  @user = User.new
  erb :"users/new"
end

# USER PROFILE
get '/users/:id' do
  if authenticated?
    erb :"users/show"
  else
    redirect '/sessions/new'
  end
end

# VALIDATE AND ADD NEW USER
post '/users' do
  @user = User.new(username: params[:username], email: params[:email], password: params[:pwd])
  if /guest/.match(params[:email])==nil && @user.save
    session[:user_id] = @user.id
    redirect '/' # will (re)set user to guest
  else
    erb :"users/new"
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
    redirect '/' # will (re)set user to guest
  else
    @error = "Email and/or password is incorrect."
    erb :"/sessions/new"
  end
end


# PROCESS LOGOUT REQUEST
get '/logout' do
  session[:user_id] = nil  # or get-guest
  redirect '/' # will (re)set user to guest
end



