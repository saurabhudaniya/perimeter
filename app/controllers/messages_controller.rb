class MessagesController < ApplicationController
  def index
    @user = current_user
    @messages = Message.where("reciever_id =?",current_user.id)
  end

  def new
    @new_message = current_user.messages.build
  end

  def create
   
    @new_message = current_user.messages.build(params[:message])
    if @new_message.save
      flash[:notice] = "Message sent successfully"
      redirect_to :back
    else
      redirect_to :back
      flash[:notice] = "#{@new_message.errors.full_messages}"
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @user = current_user
    @message = Message.find(params[:id])
    @message.update_attributes(:status => "read")
  end

end
