def current_rounds_deck round_id
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
  /guest/.match(self.sessions_user_id.to_s)!=nil
end
