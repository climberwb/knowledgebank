class CollaborationsController < ApplicationController
  respond_to :html, :js

  def about
  end
 def new
    @collaboration = Collaboration.new
    #authorize  @wiki
  end
  def create

    @wiki = Wiki.find(params[:wiki_id])
    
    begin
    
   name_search = params[:collaboration][:user_name].to_s
   
   # once links are setup with user_id
   #user = User.find(params[:user_id])

   user_by_name = User.where('name Like ?', "%#{params[:collaboration][:user_name]}%").first
   @collaboration = @wiki.collaborations.where(user_id: user_by_name.id).first_or_initialize
  
    if @collaboration.save
      flash[:notice] = "collaborator was saved"
      redirect_to  @wiki
    end
  rescue
    flash[:error] = "collaborator was not saved. #{params[:collaboration][:user_name]} is not a user "
      redirect_to  @wiki
  end 
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaboration = Collaboration.find(params[:id])
    # authorize @comment

    if @collaboration.destroy
      flash[:notice] = "Collaboration was removed."
    else
      flash[:error] = "Collaboration couldn't be deleted. Try again."
    end
  end
  
  def collaboration_search
     #name_search = params[:collaboration][:user_name].to_s
     puts "PARAMS: #{params.inspect}"
     @users_by_name = User.where('name Like ?', "%#{params[:collaboration]}%")
     puts @users_by_name.to_a
      render json: @users_by_name.map do |user|
        { name: user.name, id: user.id}
     end
  end
end


