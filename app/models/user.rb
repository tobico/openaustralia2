class User < ActiveRecord::Base
  set_primary_key 'user_id'
  
  def name
    "#{firstname} #{lastname}"
  end
  
  def self.authenticate email, password
    user = User.find_by_email email
    if user && password.crypt(user.password) == user.password  
      user
    else
      nil
    end
  end
end
