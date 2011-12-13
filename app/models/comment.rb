class Comment < ActiveRecord::Base
belongs_to :article
validates :comment ,:length =>{:maximum => 2000},:presence => true
has_many :likes

  def exists(user_id)
    @like=likes.where("user_id = ?", user_id).first
    return @like
  end

 
  
end
