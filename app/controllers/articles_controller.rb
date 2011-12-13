class ArticlesController < ApplicationController
  before_filter :find_products

  def find_products
    @products = current_user.products
  end
  
  def index
    @user     = current_user
    @articles = current_user.articles.paginate(:page => params[:page], :per_page => 6)
    
  end

  def show
    @user             = current_user
    @like             = Like.new
    @article          = @user.articles.find(params[:id])
    @comments         = @article.comments.all
    @comment          = @article.comments.build
    p"==============="
    p @comment_reply
    respond_to do |format|
      format.html # index.html.erb
      format.rss
    end
  end

  def new
    @user=current_user
    @article=@user.articles.build
  end

  def create
    @user = current_user
    @article=@user.articles.build(params[:article])
    if @article.save
      flash[:notice] = "article created successfully"
      redirect_to user_articles_path(@user)
    else
      redirect_to :back
      flash[:notice] = "#{@article.errors.full_messages}"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @user=current_user
    @article=@user.articles.find(params[:id])
    if @article.destroy
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
    end
  end

end
