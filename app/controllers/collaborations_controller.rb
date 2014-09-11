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
    
    #if Collaboration.find(User.find_by_name(params[:collaboration][:user_name]).id) == nil
    begin
     # @collaboration = @wiki.collaborations.where(user_id: current_user.id).build(user_id: User.find_by_name(params[:collaboration][:user_name]).id)
   # end
   user_by_name = User.find_by_name(params[:collaboration][:user_name])
   @collaboration = @wiki.collaborations.where(user_id: user_by_name.id).first_or_initialize
   # else
  #     flash[:error] = "You already have #{User.find_by_name(params[:collaboration][:user_name]).name} as a collaborator was saved"
  #       redirect_to  @wiki
  # #  end
    #build(:name => "Jake")
   # @collaboration = current_user.collaborations.build(params.require(:collaboration).permit(:user_id))#User.find_by_name(:user_name).id)
     # @collaboration = @wiki.collaborations.where(user_id: current_user.id).first
     # @collaboration.user = User.find_by_name(params[:collaboration][:user_name])
     # if @collaboration.update_attributes(collaboration_attributes)
     #     flash[:notice] = "col was saved"
     #     redirect_to  @wiki  
     # else
     #  flash[:error] = "col was not saved"
     #  render :new
     # end
    
     
    if @collaboration.save
      flash[:notice] = "collaborator was saved"
      redirect_to  @wiki
    else
      flash[:error] = "collaborator was not saved"
      redirect_to  @wiki
      #flash[:notice] = User.find_by_name(:user_name)
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
end


