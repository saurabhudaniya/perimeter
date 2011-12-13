class Article < ActiveRecord::Base
validates :description ,:title, :image ,:presence => true
belongs_to :user
has_many :comments
end
