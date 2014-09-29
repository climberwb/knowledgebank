class CollaborationsController < ApplicationController
  respond_to :html, :js

 def show
   @wiki = Wiki.find(params[:id])
   @collaboration = @wiki.collaborations.order(:id).page( params[:page]).per(8)
   authorize @wiki
 end  


  def about
  end
  
  def new
    @collaboration = Collaboration.new(params[:user])
    #authorize  @wiki
  end
  
  def create

    @wiki = Wiki.find(params[:wiki_id])
    
    begin
    
      # name_search = params[:collaboration][:user_name].to_s
     
      # once links are setup with user_id
      # user = User.find(params[:user_id])

      # user_by_name = User.where('name Like ?', "%#{params[:collaboration][:user_name]}%").first
      # @collaboration = @wiki.collaborations.where(user_id: user_by_name.id).first_or_initialize
    
      @collaboration = @wiki.collaborations.where(user_id: params[:collaboration][:user_id]).first_or_initialize
      if @collaboration.save
        flash[:notice] = "collaborator was saved #{params[:collaboration][:user_name]}"
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
     @users_by_name = User.where('name Like ?', "%#{params[:collaboration]}%").limit(4)
     # puts @users_by_name.to_a
     #  render json: @users_by_name
  end
end