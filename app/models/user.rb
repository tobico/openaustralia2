class User < ActiveRecord::Base
  set_primary_key 'user_id'
  
  validates_presence_of :email, :password
  validates_confirmation_of :password
  
  def name
    "#{firstname} #{lastname}"
  end
  
  def self.authenticate email, password
    match = User.find_by_email email
    if match && password.crypt(match.password) == match.password  
      match
    else
      nil
    end
  end
  
  def mp_alert
    false
  end
  
  def mp_alert=
  end
  
end
