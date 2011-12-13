class User < ActiveRecord::Base
validates :name , :address , :contact , :email  , :presence => true
validates :name ,:uniqueness => true
validates :password ,:length => {:in => 6..20}
has_many :products
has_many :articles
has_many :messages

  has_attached_file :image
end
