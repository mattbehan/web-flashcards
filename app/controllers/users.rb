# SHOW SESSION USER'S STATS PROFILE
get '/users' do
 # @this_user = User.find_by(session[:uid])
  if authenticated?(this_user)
    @user = {username: "Jabloni"}
    erb :"users/index"
  else
    redirect '/'
  end
end

