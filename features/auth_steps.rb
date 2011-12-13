
Given /^a registered user with his credentials$/ do
@user=User.new 
  @username = @user.username
  @password =@user.password
end

When /^user enter user his login credentials$/ do
 @user.check(@username,@password)

end

Then /^user should see welcome page with his information$/ do
   if @user.check(@username,@password) == "success"
     @user.welcome_page
   else
    @user.show_errors
  end
end


Given /^a user with all his details$/ do
@current_user=Current_user.new
end

Given /^user should able to see all his options like create product , create article , show article, show product$/ do
@options = Webpage.options
end

When /^user clicks on options$/ do
  @current_user.select
  @current_user.select
end


class Current_user
def self.find(id)
return  
end
def select
return 
end
end


class Webpage
def self.options
return
end
end



class User
def username
 username = "saurabh"
end
def password
 password = "saurabh"
end
def check(username,password)
if username =="saurabh" && password =="saurabh"
return "success"
else
return "errors"
end
end
def  welcome_page
return "welcome"
end
def show_errors
return "cannot authenticate user"
end
end
