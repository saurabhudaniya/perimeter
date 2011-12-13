class ProductsController < ApplicationController
before_filter :find_products

def find_products
@user = current_user
     @products = @user.products
end

  def new
   @user = current_user
   @product = @user.products.build
  end

  def create
  @user=current_user
 @product=@user.products.build(params[:product])
if @product.save
redirect_to user_products_path(@user) 
else
render :action => "edit"
end
 
  end

  def show
  @user=current_user
 @product=@user.products.find(params[:id])
  end

  def index
@user=current_user
@products=@user.products.all
  end

  def delete
  end

  def edit
  end

  def update
  end

end
