class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
    @collaborators = @wiki.collaborations
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
    authorize  @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @collaboration = Collaboration.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:title, :body, :public))
    # raise
    if @wiki.save
      flash[:notice] = "Wiki was saved"
      redirect_to  @wiki
    else
      flash[:error] = "Wiki was not saved"
      render :new
    end
  end
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body, :public))
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again"
      render :edit
  end
end
def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.users.find(params[:user_id])

   
    # authorize @comment

    if @collaborator.destroy
      flash[:notice] = "Collaboration was removed."
    else
      flash[:error] = "Collaboration couldn't be deleted. Try again."
    end

    # respond_with(@comment) do |f|
    #   f.html { redirect_to [@topic, @post] }
    # end
  end
  def collaboration
   @wiki = Wiki.find(params[:id])
   #@collabor
   # @collaboration = current_user.wiki.collaborations.build(params.permit(:user_id))
   # if @collabs.save
   #    flash[:notice] = "Collaboration was saved"
   #    redirect_to  @collaboration
   #  else
   #    flash[:error] = "Collaboration was not saved"
   #    render :new
   #  end
   #authorize @wiki
   @collabs = @wiki.collaborations.build(params.permit(:user_id))
   @collabs.save # Wishful coding -- you need to define this in Wiki.rb. Our HMT resource (https://www.bloc.io/resources/has-many-through) could help you with this.
  # @non_collabs = @wiki.non_collaborators # More, more difficult, wishful coding. Look up AR's `where.not()` syntax
  end

end
