class UsersController < ApplicationController
  def index
  end

  def show
     if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @wikis = @user.wikis

      authorize @user
     else
         redirect_to root_path
     end
  end

  def new
  end

  def edit
  end
  def destroy
  end

end
