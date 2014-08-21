class WikiPolicy < ApplicationPolicy
 def index?
 # true
 false
  #(user.present? && (record.user == user || user.role?(:admin)) && ) ||
 end



def show?
  # false
    scope.where(:id => record.id).exists? &&  (record.public? ==true ||  (user.present? && (record.user == user || user.role?(:admin))))     
  end
end