class AllController < ApplicationController
  before_filter :find_products

  def find_products
    @user = current_user
    @products = @user.products
  end
  
  def users
    @allusers=User.all
  end

  def articles
    @all_articles = Article.paginate(:page => params[:page], :per_page => 10)
  end

  def products
  end

  def showuser
  end

  def showarticle
    @user=current_user
    @article=Article.find(params[:id])
    @comments=@article.comments.all
    @comment=@article.comments.build
    @like = Like.new
  end

  def showproduct
  end

end
