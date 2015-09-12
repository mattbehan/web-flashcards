def current_rounds_deck(round_id)
  @current_rounds_deck ||= Round.find_by(id: round_id).deck
end

def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def sessions_user_id
  @sessions_user_id ||= session[:user_id]
end

require 'date'
def get_guest
  "guest#{rand(10000)}#{DateTime.now.to_s}"
end

def is_guest?# (id_to_examine)
  /guest/.match(self.current_user.email)!=nil
end

def authenticated?
  if current_user.id == params[:id]
    true
  else
    false
  end
end

def create_guest
  guest = User.create(username: "guest", email: get_guest, password: "x")
  session[:user_id] = guest.id
end
