def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def sign_in(a_user=nil)

end
