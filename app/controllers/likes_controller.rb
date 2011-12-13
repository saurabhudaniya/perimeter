class LikesController < ApplicationController
  def new
@user=current_user
@comment = Comment.find(params[:comment_id])
@like =@comment.likes.build
  end

  def create
@comment=Comment.find(params[:like][:comment_id])
@like=@comment.likes.build(params[:like])
@like.save

respond_to do |format|
  format.html {redirect_to likes_path}
  format.js
end

  end

  def destroy
@like=Like.find(params[:id])
@like.destroy
@comment=Comment.where('id = ?',@like.comment_id).first
p"============"
p @comment
respond_to do |format|
  format.html 
  format.js
  end
  
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

end
