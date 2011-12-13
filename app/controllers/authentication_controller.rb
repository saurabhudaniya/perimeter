class AuthenticationController < ApplicationController
skip_before_filter :current_user


  



  def login
   @user = User.new
   render :layout => false
  end

  def signup
  end

  def check
   @user= User.find(:first,:conditions=>["name =? and password=?",params[:username],params[:password]])
     if @user
     session[:current_user]= @user.id
     redirect_to user_path(User.find(session[:current_user]))
     else
     redirect_to root_path
     flash[:notice] = 'username password not matched'
     end
  end
   def new
   @user = User.new
   render :layout=> false
   end

   def create
    
    @user = User.new(params[:user])
    p "hhhhhhhhhhhh"
    a = params[:password]
    b = params[:user][:password]
    if a == b
        if @user.save
        redirect_to root_path
        flash[:notice] = 'User  successfully created.' 
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

   def logout
     session[:current_user] = nil
     redirect_to root_path
   end   

   end
