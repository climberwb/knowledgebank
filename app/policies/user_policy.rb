class UserPolicy < ApplicationPolicy

 def show?
 # current_user.id == params[:id]
  true
 end


end