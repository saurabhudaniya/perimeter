class Message < ActiveRecord::Base
  belongs_to :user
  
  def sender
    @sender = User.where("id = ?",user_id).first
    return @sender.name
  end
end
