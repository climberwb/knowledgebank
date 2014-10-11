class UsersController < ApplicationController
  

  def show
     if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @wikis = @user.wikis
      @collaboration_wikis = @user.collaborations.pluck :wiki_id
      authorize @user
     else
         redirect_to root_path
     end
  end
  def index
  end
  def new
  end

  def edit
  end
  def destroy
  end

end
