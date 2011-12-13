class UsersController < ApplicationController
  before_filter :find_products

  def find_products
    @user = current_user
    @products = @user.products
  end

  def change_password
    @user=current_user
    if (params[:old_password]== @user.password) && (params[:new_password] ==  params[:user][:password])
     if @user.update_attributes(params[:user])
     flash[:notice] = "password changed successfully"
     else
       flash[:notice] =@user.errors.full_messages
     end
     redirect_to :back
    else
      flash[:notice] ="either old password is not correct or new passwords not matched"
      redirect_to :back
    end
  end

  def show
    @user = current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json {  }
    end
  end

  # GET /users/new
  # GET /users/new.json

  # GET /users/1/edit
  def edit
    @user = current_user
  end
  def new
    @user=User.new
  end
  # POST /users
  # POST /users.json
  def create

    @user = User.new(params[:user])
    p "hhhhhhhhhhhh"
    a = params[:password]
    b = params[:user][:password]
    if a == b
      if @user.save
        redirect_to root_path
        flash[:notice] = 'User was successfully created.' 
      else
        flash[:notice] = "#{@user.errors.full_messages}"
        redirect_to :back
        #render json: @user.errors, status: :unprocessable_entity
      end
        
    else
      flash[:notice] = "password not matched"
      redirect_to :back
    end

  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice =>'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json  => @user.errors}
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :ok }
    end
  end
end
