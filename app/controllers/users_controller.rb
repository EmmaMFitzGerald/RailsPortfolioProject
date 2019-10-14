class UsersController < ApplicationController

def show
    @user = User.find(params[:id])
    @children = @user.children
    @children_with_memories = @user.children_with_memories - @children  
end

def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
end 
  

end 