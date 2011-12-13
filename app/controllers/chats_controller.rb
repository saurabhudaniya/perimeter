class ChatsController < ApplicationController
  before_filter :find_products

def find_products
@user = current_user
@products = @user.products
end
  def index
    @chats = Chat.all
    @chat=Chat.new
  end

  def show
        
    @chats = Chat.all
  end

  def edit
  end

  def update
    render :layout => false
    @chats = Chat.all
  end

  def destroy
  end

  def create
    @chat = Chat.new(params[:chat])
    @chat.save
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
  end

end
