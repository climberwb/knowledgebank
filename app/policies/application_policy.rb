class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists? 
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
     user.present? && ((record.user == user || user.role?(:admin)) || (record.users.where(:id => user.id).present?))
  end

  def edit?
    update?
    
  end

  def destroy?
    update?
  end

  def scope
    record.class
  end

  def edit_form_settings?
    scope.where(:id => record.id).exists? &&  (record.public? ==true ||  (user.present? && (record.user == user || user.role?(:admin)))) 
  end

  def paid_user_perks?
      user.user_level == "Member"
  end
end

