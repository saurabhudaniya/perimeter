class MessagesController < ApplicationController
  def index
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
  end

end
